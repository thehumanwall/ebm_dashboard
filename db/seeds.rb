# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Add the faker gem to generate random data
require 'faker'

# Wrap the seeding process in a transaction for performance
ActiveRecord::Base.transaction do
  # Clear existing data to ensure a clean slate, in reverse order of dependency
  puts "Destroying existing data..."
  Measurement.destroy_all
  Experiment.destroy_all
  GoalKvm.destroy_all
  Goal.destroy_all
  Kvm.destroy_all
  Kva.destroy_all
  Organization.destroy_all

  puts "Seeding new data..."

  # 1. Organization
  # Create one main organization for all other data to belong to.
  main_org = Organization.create!(
    name: Faker::Company.name,
    vision_statement: Faker::Company.bs.capitalize + " in order to " + Faker::Company.catch_phrase.downcase + ".",
    mission_statement: "To leverage " + Faker::Company.buzzword + " methodologies to achieve our vision."
  )
  puts "Created Organization: #{main_org.name}"

  # 2. Key Value Areas (KVAs)
  # This data is specific and comes directly from the EBM guide.
  puts "Seeding Key Value Areas..."
  kvas = {}
  kvas_data = [
    {
      name: 'Current Value',
      description: 'Measures the value that the product delivers to customers and stakeholders at the present time. [cite: 172]'
    },
    {
      name: 'Unrealized Value',
      description: 'Measures the potential future value that could be realized if the organization met the needs of all potential customers. [cite: 186]'
    },
    {
      name: 'Ability to Innovate',
      description: 'Measures the effectiveness of an organization in delivering new capabilities and innovative solutions. [cite: 203]'
    },
    {
      name: 'Time-to-Market',
      description: 'Measures how quickly the organization can deliver and learn from feedback gathered from experiments. [cite: 218]'
    }
  ]

  kvas_data.each do |data|
    kva = Kva.create!(data)
    kvas[data[:name]] = kva # Store for easy lookup
  end
  puts "  - #{Kva.count} KVAs seeded."

  # 3. Key Value Measures (KVMs)
  # Create a few random KVMs for each KVA based on examples from the guide.
  puts "Seeding Key Value Measures..."
  all_kvms = []
  kvm_examples = {
    'Current Value' => [ 'Customer Satisfaction', 'Employee Satisfaction', 'Product Cost Ratio' ],
    'Unrealized Value' => [ 'Market Share Gap', 'Customer Desired Experience Gap', 'Potential Market Size' ],
    'Ability to Innovate' => [ 'Innovation Rate', 'Defect Trends', 'Technical Debt' ],
    'Time-to-Market' => [ 'Lead Time for Changes', 'Deployment Frequency', 'Time to Restore Service' ]
  }

  kvm_examples.each do |kva_name, kvm_names|
    kvm_names.each do |name|
      all_kvms << Kvm.create!(
        name: name,
        description: Faker::Lorem.sentence(word_count: 10),
        unit_of_measure: [ 'Days', 'Percentage', 'Count', 'USD' ].sample,
        is_active: true,
        organization: main_org,
        kva: kvas[kva_name]
      )
    end
  end
  puts "  - #{Kvm.count} KVMs seeded."

  # 4. Goals (Strategic, Intermediate, and Tactical)
  # Create a hierarchy of goals.
  puts "Seeding Goals..."
  strategic_goal = Goal.create!(
    organization: main_org,
    name: "Become Market Leader in #{Faker::Commerce.department}",
    description: "Achieve dominant market share by focusing on customer outcomes and out-innovating competitors.",
    goal_type: 'strategic',
    status: 'active',
    target_date: Faker::Time.forward(days: 730)
  )

  intermediate_goals = []
  2.times do
    intermediate_goals << Goal.create!(
      organization: main_org,
      parent_goal: strategic_goal,
      name: "Launch Next-Gen Product Line: #{Faker::Commerce.product_name}",
      description: "Successfully complete the development and launch of our next generation platform.",
      goal_type: 'intermediate',
      status: 'active',
      target_date: Faker::Time.forward(days: 365)
    )
  end

  tactical_goals = []
  5.times do
    tactical_goals << Goal.create!(
      organization: main_org,
      parent_goal: intermediate_goals.sample,
      name: "Improve Onboarding Flow - #{Faker::Verb.base.capitalize}",
      description: "Reduce customer drop-off during the initial sign-up and setup process.",
      goal_type: 'immediate_tactical',
      status: 'active',
      target_date: Faker::Time.forward(days: 90)
    )
  end
  puts "  - #{Goal.count} Goals seeded (Strategic, Intermediate, and Tactical)."

  # 5. GoalKvm (Join Table)
  # Associate random KVMs with each non-strategic goal.
  puts "Associating KVMs with Goals..."
  (intermediate_goals + tactical_goals).each do |goal|
    kvms_to_assign = all_kvms.sample(rand(2..4))
    goal.kvms = kvms_to_assign
  end
  puts "  - KVMs associated."

  # 6. Experiments
  # Create experiments for our tactical goals.
  puts "Seeding Experiments..."
  all_experiments = []
  10.times do
    all_experiments << Experiment.create!(
      goal: tactical_goals.sample,
      name: "A/B Test: #{Faker::Marketing.buzzwords.capitalize}",
      hypothesis: "We believe that #{Faker::Verb.ing_form} the #{Faker::Hacker.noun} will result in an increase in #{Faker::Hacker.noun} for new users.",
      actions_taken: "Deployed a new version of the component and routed 50% of traffic to it.",
      start_date: Faker::Time.backward(days: 14),
      end_date: Faker::Time.backward(days: 1),
      status: [ 'completed', 'running' ].sample,
      inspection_summary: "The data showed a #{rand(5..25)}% lift in the target metric.",
      adaptation_summary: "We will roll this change out to 100% of users in the next sprint."
    )
  end
  puts "  - #{Experiment.count} Experiments seeded."

  # 7. Measurements
  # Create measurements for our KVMs, ensuring each is tied to an experiment.
  puts "Seeding Measurements..."
  all_experiments.each do |experiment|
    # Get the KVMs that are relevant to this experiment's goal
    relevant_kvms = experiment.goal.kvms
    next if relevant_kvms.empty? # Skip if the goal has no associated KVMs

    # For each experiment, create 2 to 5 related measurements
    rand(2..5).times do
      Measurement.create!(
        kvm: relevant_kvms.sample, # Pick a random, relevant KVM
        experiment: experiment,    # Assign the current experiment
        value: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        measurement_date: Faker::Time.between(from: experiment.start_date, to: experiment.end_date),
        notes: "Data point collected during '#{experiment.name}'."
      )
    end
  end
  puts "  - #{Measurement.count} Measurements seeded."

  puts "\nSeeding complete!"
end
