# db/seeds.rb

# Clear existing data
puts "Clearing existing data..."
Measurement.destroy_all
Experiment.destroy_all
GoalKvm.destroy_all
Kvm.destroy_all
Kva.destroy_all
Goal.destroy_all
Session.destroy_all
User.destroy_all
Organization.destroy_all

puts "Creating Users..."
user1 = User.create!(
  email_address: "test@test.com",
  password: "test",
  password_confirmation: "test"
)

user2 = User.create!(
  email_address: "john.smith@datadriven.com",
  password: "password456",
  password_confirmation: "password456"
)

puts "Creating Sessions..."
Session.create!(
  user: user1,
  ip_address: "192.168.1.1",
  user_agent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
)

Session.create!(
  user: user2,
  ip_address: "10.0.0.1",
  user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15"
)

# Create an organization
puts "Creating organization..."
organization = Organization.create!(
  name: "TechInnovate Solutions",
  vision_statement: "To be the global leader in technology-driven business transformation.",
  mission_statement: "We empower businesses to achieve extraordinary results through innovative technology solutions and data-driven decision making."
)

# Create KVAs (Key Value Areas)
puts "Creating KVAs..."
kva_customer = Kva.create!(name: "Customer Value", description: "Metrics related to customer satisfaction and value delivery")
kva_financial = Kva.create!(name: "Financial Performance", description: "Metrics related to revenue, profitability, and financial health")
kva_operational = Kva.create!(name: "Operational Excellence", description: "Metrics related to internal processes and operational efficiency")
kva_innovation = Kva.create!(name: "Innovation", description: "Metrics related to new product development and innovation")

# Create KVMs (Key Value Measures)
puts "Creating KVMs..."
kvms = [
  Kvm.create!(name: "Customer Satisfaction Score", description: "Measure of overall customer satisfaction", unit_of_measure: "1-10 scale", is_active: true, organization: organization, kva: kva_customer),
  Kvm.create!(name: "Net Promoter Score", description: "Likelihood of customers to recommend our products", unit_of_measure: "-100 to 100", is_active: true, organization: organization, kva: kva_customer),
  Kvm.create!(name: "Monthly Recurring Revenue", description: "Monthly subscription revenue", unit_of_measure: "USD", is_active: true, organization: organization, kva: kva_financial),
  Kvm.create!(name: "Profit Margin", description: "Percentage of revenue that is profit", unit_of_measure: "%", is_active: true, organization: organization, kva: kva_financial),
  Kvm.create!(name: "Defect Rate", description: "Rate of defects in production", unit_of_measure: "%", is_active: true, organization: organization, kva: kva_operational),
  Kvm.create!(name: "Time to Market", description: "Time from concept to delivery", unit_of_measure: "Days", is_active: true, organization: organization, kva: kva_operational),
  Kvm.create!(name: "New Feature Adoption", description: "Percentage of users adopting new features", unit_of_measure: "%", is_active: true, organization: organization, kva: kva_innovation),
  Kvm.create!(name: "R&D Investment Ratio", description: "Percentage of revenue invested in R&D", unit_of_measure: "%", is_active: true, organization: organization, kva: kva_innovation)
]

# Create Strategic Goals
puts "Creating strategic goals..."
strategic_goals = [
  Goal.create!(
    name: "Expand Market Share in Enterprise Segment",
    description: "Become a dominant player in the enterprise market by increasing our market share from 15% to 25%",
    goal_type: "strategic",
    status: "active",
    target_date: 1.year.from_now.to_date,
    organization: organization,
    parent_goal_id: nil
  ),

  Goal.create!(
    name: "Achieve Industry-Leading Customer Satisfaction",
    description: "Elevate our customer satisfaction metrics to become the benchmark in our industry",
    goal_type: "strategic",
    status: "active",
    target_date: 18.months.from_now.to_date,
    organization: organization,
    parent_goal_id: nil
  ),

  Goal.create!(
    name: "Establish Technological Leadership",
    description: "Position our company as the technological thought leader in our space through innovation and excellence",
    goal_type: "strategic",
    status: "active",
    target_date: 2.years.from_now.to_date,
    organization: organization,
    parent_goal_id: nil
  )
]

# Create Intermediate Goals
puts "Creating intermediate goals..."
intermediate_goals = []

# For the Market Share strategic goal
intermediate_goals << Goal.create!(
  name: "Develop Enterprise-focused Product Suite",
  description: "Create a comprehensive product offering tailored to enterprise customer needs",
  goal_type: "intermediate",
  status: "active",
  target_date: 9.months.from_now.to_date,
  organization: organization,
  parent_goal_id: strategic_goals[0].id
)

intermediate_goals << Goal.create!(
  name: "Establish Strategic Partnerships",
  description: "Form alliances with complementary service providers to expand our enterprise reach",
  goal_type: "intermediate",
  status: "active",
  target_date: 8.months.from_now.to_date,
  organization: organization,
  parent_goal_id: strategic_goals[0].id
)

# For the Customer Satisfaction strategic goal
intermediate_goals << Goal.create!(
  name: "Enhance Customer Support Experience",
  description: "Transform our support organization into a proactive customer success partner",
  goal_type: "intermediate",
  status: "active",
  target_date: 12.months.from_now.to_date,
  organization: organization,
  parent_goal_id: strategic_goals[1].id
)

intermediate_goals << Goal.create!(
  name: "Improve Product Usability",
  description: "Redesign core product interfaces to enhance usability and customer satisfaction",
  goal_type: "intermediate",
  status: "active",
  target_date: 10.months.from_now.to_date,
  organization: organization,
  parent_goal_id: strategic_goals[1].id
)

# For the Technological Leadership strategic goal
intermediate_goals << Goal.create!(
  name: "Launch Innovation Lab",
  description: "Establish a dedicated innovation team to explore emerging technologies",
  goal_type: "intermediate",
  status: "active",
  target_date: 6.months.from_now.to_date,
  organization: organization,
  parent_goal_id: strategic_goals[2].id
)

intermediate_goals << Goal.create!(
  name: "Increase Industry Recognition",
  description: "Gain recognition through thought leadership, speaking engagements, and industry awards",
  goal_type: "intermediate",
  status: "active",
  target_date: 15.months.from_now.to_date,
  organization: organization,
  parent_goal_id: strategic_goals[2].id
)

# Create Immediate Tactical Goals
puts "Creating immediate tactical goals..."
tactical_goals = []

# For the "Develop Enterprise-focused Product Suite" intermediate goal
tactical_goals << Goal.create!(
  name: "Complete Enterprise Security Module",
  description: "Develop and launch enhanced security features required by enterprise customers",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 3.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[0].id
)

tactical_goals << Goal.create!(
  name: "Deploy Advanced Analytics Dashboard",
  description: "Create executive-level analytics dashboard for enterprise customers",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 5.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[0].id
)

# For the "Establish Strategic Partnerships" intermediate goal
tactical_goals << Goal.create!(
  name: "Secure Three Integration Partners",
  description: "Establish formal partnerships with three complementary service providers",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 4.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[1].id
)

tactical_goals << Goal.create!(
  name: "Launch Partner Certification Program",
  description: "Create training and certification program for partner organizations",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 6.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[1].id
)

# For the "Enhance Customer Support Experience" intermediate goal
tactical_goals << Goal.create!(
  name: "Implement 24/7 Support Coverage",
  description: "Expand support hours to provide around-the-clock assistance",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 2.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[2].id
)

tactical_goals << Goal.create!(
  name: "Deploy Proactive Monitoring System",
  description: "Implement system to detect and address customer issues before they report them",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 4.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[2].id
)

# For the "Improve Product Usability" intermediate goal
tactical_goals << Goal.create!(
  name: "Complete UX Research Study",
  description: "Conduct comprehensive user experience research with existing customers",
  goal_type: "immediate_tactical",
  status: "achieved",
  target_date: 1.month.ago.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[3].id
)

tactical_goals << Goal.create!(
  name: "Redesign Core Workflow Interface",
  description: "Redesign the main user workflow based on UX research findings",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 3.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[3].id
)

# For the "Launch Innovation Lab" intermediate goal
tactical_goals << Goal.create!(
  name: "Hire Innovation Team",
  description: "Recruit specialized talent for the innovation lab initiative",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 2.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[4].id
)

tactical_goals << Goal.create!(
  name: "Define First Innovation Challenge",
  description: "Select and scope the first major innovation initiative",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 3.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[4].id
)

# For the "Increase Industry Recognition" intermediate goal
tactical_goals << Goal.create!(
  name: "Submit to Industry Awards",
  description: "Identify and submit applications for relevant industry recognition",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 4.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[5].id
)

tactical_goals << Goal.create!(
  name: "Publish Thought Leadership Content",
  description: "Create and publish research-based white papers and articles",
  goal_type: "immediate_tactical",
  status: "active",
  target_date: 3.months.from_now.to_date,
  organization: organization,
  parent_goal_id: intermediate_goals[5].id
)

# Create Goal-KVM associations
puts "Creating goal-KVM associations..."
strategic_goals.each do |goal|
  # Associate strategic goals with relevant KVMs
  GoalKvm.create!(goal: goal, kvm: kvms.sample(2).first)
  GoalKvm.create!(goal: goal, kvm: kvms.sample(2).first)
end

intermediate_goals.each do |goal|
  # Associate intermediate goals with relevant KVMs
  GoalKvm.create!(goal: goal, kvm: kvms.sample)
end

tactical_goals.each do |goal|
  # Associate tactical goals with relevant KVMs
  GoalKvm.create!(goal: goal, kvm: kvms.sample)
end

# Create Experiments
puts "Creating experiments..."
experiments = [
  # For a strategic goal
  Experiment.create!(
    name: "Enterprise Customer Feedback Program",
    hypothesis: "By implementing a structured feedback program with enterprise customers, we can identify key pain points and address them to increase satisfaction.",
    actions_taken: "Set up interviews with 15 enterprise customers, formed feedback council, established regular feedback sessions.",
    start_date: 2.weeks.ago,
    end_date: 3.months.from_now,
    status: "running",
    inspection_summary: "Initial feedback indicates strong interest in security features and integration capabilities.",
    adaptation_summary: "Reprioritized roadmap to accelerate security enhancements based on early feedback.",
    goal: strategic_goals.first
  ),

  # For an intermediate goal
  Experiment.create!(
    name: "Customer Success Team Reorganization",
    hypothesis: "Reorganizing support teams into industry-specific groups will improve customer satisfaction scores.",
    actions_taken: "Restructured support team, provided industry-specific training, established new response protocols.",
    start_date: 1.month.ago,
    end_date: 1.week.ago,
    status: "completed",
    inspection_summary: "Customer satisfaction scores increased by 18% during the experiment period.",
    adaptation_summary: "Made the reorganization permanent and expanding the model to all customer segments.",
    goal: intermediate_goals[2]
  ),

  # For a tactical goal
  Experiment.create!(
    name: "UX Simplification Test",
    hypothesis: "Reducing the number of steps in the core workflow from 7 to 4 will increase user efficiency and satisfaction.",
    actions_taken: "Developed simplified workflow prototype, recruited test group of 50 users, collected metrics on completion times and satisfaction.",
    start_date: 2.months.ago,
    end_date: 2.weeks.ago,
    status: "completed",
    inspection_summary: "Task completion times reduced by 40%, user satisfaction increased by 25%.",
    adaptation_summary: "Approved simplified workflow for all customers in next release.",
    goal: tactical_goals[7]
  ),

  # Another tactical experiment (running)
  Experiment.create!(
    name: "Partner Onboarding Program Test",
    hypothesis: "A structured onboarding program will reduce time-to-productivity for new integration partners.",
    actions_taken: "Developed onboarding materials, created certification pathway, established partner success metrics.",
    start_date: 3.weeks.ago,
    end_date: 6.weeks.from_now,
    status: "running",
    inspection_summary: "Initial results show 30% faster integration completion compared to previous partners.",
    adaptation_summary: "Adding more technical documentation based on early partner feedback.",
    goal: tactical_goals[3]
  ),

  # A planned experiment
  Experiment.create!(
    name: "AI-Powered Support Assistant Pilot",
    hypothesis: "Implementing an AI assistant for tier-1 support will reduce response times and increase customer satisfaction.",
    actions_taken: "Selected AI platform, trained model on support documentation, prepared test scenarios.",
    start_date: 2.weeks.from_now,
    end_date: 2.months.from_now,
    status: "planned",
    inspection_summary: "",
    adaptation_summary: "",
    goal: tactical_goals[5]
  )
]

puts "Seed data created successfully!"
