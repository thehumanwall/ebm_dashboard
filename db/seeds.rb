# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the `bin/rails db:seed` command (or created alongside the database with `db:setup`).

# Clear existing data to start fresh
puts "Clearing existing data..."
Measurement.destroy_all
Experiment.destroy_all
GoalKvm.destroy_all
Goal.destroy_all
Kvm.destroy_all
Kva.destroy_all
Session.destroy_all
User.destroy_all
Organization.destroy_all

puts "Creating Organizations..."
org1 = Organization.create!(
  name: "Agile Innovators Inc.",
  vision_statement: "To be the leading provider of agile transformation solutions.",
  mission_statement: "To empower organizations to achieve their strategic goals through innovative and agile practices."
)

org2 = Organization.create!(
  name: "Data-Driven Decisions LLC",
  vision_statement: "To revolutionize industries through the power of data.",
  mission_statement: "To provide actionable insights and data-driven strategies that foster growth and efficiency."
)

puts "Creating Users..."
user1 = User.create!(
  email_address: "jane.doe@agileinnovators.com",
  password: "password123",
  password_confirmation: "password123"
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


puts "Creating Key Value Areas (KVAs)..."
current_value_kva = Kva.create!(name: "Current Value", description: "Measures the value delivered to customers and stakeholders today.")
time_to_market_kva = Kva.create!(name: "Time-to-Market", description: "Measures the organization's ability to deliver value quickly.")
ability_to_innovate_kva = Kva.create!(name: "Ability to Innovate", description: "Measures the organization's capacity to develop and introduce new capabilities.")
unrealized_value_kva = Kva.create!(name: "Unrealized Value", description: "Measures the potential future value that could be realized by meeting customer needs.")


puts "Creating Key Value Measures (KVMs)..."
# KVMs for Agile Innovators Inc.
kvm1_org1 = Kvm.create!(name: "Customer Satisfaction Score (CSAT)", description: "Measures customer satisfaction with our products/services.", unit_of_measure: "Score (1-10)", is_active: true, organization: org1, kva: current_value_kva)
kvm2_org1 = Kvm.create!(name: "Lead Time to Deploy", description: "Time from code commit to production deployment.", unit_of_measure: "Days", is_active: true, organization: org1, kva: time_to_market_kva)
kvm3_org1 = Kvm.create!(name: "Feature Adoption Rate", description: "Percentage of users actively using new features.", unit_of_measure: "Percentage", is_active: true, organization: org1, kva: ability_to_innovate_kva)

# KVMs for Data-Driven Decisions LLC
kvm1_org2 = Kvm.create!(name: "Net Promoter Score (NPS)", description: "Measures customer loyalty and willingness to recommend.", unit_of_measure: "Score (-100 to 100)", is_active: true, organization: org2, kva: current_value_kva)
kvm2_org2 = Kvm.create!(name: "Cycle Time", description: "Time taken to complete a work item from start to finish.", unit_of_measure: "Hours", is_active: true, organization: org2, kva: time_to_market_kva)
kvm3_org2 = Kvm.create!(name: "Market Share Growth", description: "Percentage increase in market share.", unit_of_measure: "Percentage", is_active: true, organization: org2, kva: unrealized_value_kva)

puts "Creating Goals..."

# --- Organization 1: Agile Innovators Inc. ---

# Strategic Goal 1
sg1_org1 = Goal.create!(
  name: "Increase Customer Value by 20% in the next fiscal year",
  description: "Focus on initiatives that directly improve the value we provide to our customers, leading to higher satisfaction and retention.",
  goal_type: :strategic,
  status: :active,
  target_date: Date.today.next_year,
  organization: org1
)

# Intermediate Goal for SG1
ig1_sg1_org1 = Goal.create!(
  name: "Enhance Core Product Suite",
  description: "Improve existing features and add new capabilities to our core products based on customer feedback.",
  goal_type: :intermediate,
  status: :active,
  target_date: Date.today + 6.months,
  organization: org1,
  parent_goal: sg1_org1
)

# Immediate Tactical Goals for IG1
itg1_ig1_org1 = Goal.create!(
  name: "Reduce UI Latency by 15%",
  description: "Optimize frontend and backend performance to provide a faster and more responsive user experience.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 3.months,
  organization: org1,
  parent_goal: ig1_sg1_org1
)

itg2_ig1_org1 = Goal.create!(
  name: "Implement Top 3 Requested Features",
  description: "Develop and launch the top three features requested by our power users to increase their engagement.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 3.months,
  organization: org1,
  parent_goal: ig1_sg1_org1
)

# Strategic Goal 2
sg2_org1 = Goal.create!(
  name: "Accelerate Innovation Cycles by 30%",
  description: "Reduce the time it takes to go from idea to market to stay ahead of the competition.",
  goal_type: :strategic,
  status: :active,
  target_date: Date.today.next_year,
  organization: org1
)

# Intermediate Goal for SG2
ig1_sg2_org1 = Goal.create!(
  name: "Streamline Development Pipeline",
  description: "Automate and optimize our CI/CD pipeline to enable faster and more frequent deployments.",
  goal_type: :intermediate,
  status: :active,
  target_date: Date.today + 6.months,
  organization: org1,
  parent_goal: sg2_org1
)

# Immediate Tactical Goals for IG1_SG2
itg1_ig1_sg2_org1 = Goal.create!(
  name: "Achieve 90% Code Coverage",
  description: "Increase automated test coverage to improve code quality and reduce manual testing time.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 2.months,
  organization: org1,
  parent_goal: ig1_sg2_org1
)

itg2_ig1_sg2_org1 = Goal.create!(
  name: "Migrate to Kubernetes",
  description: "Containerize applications and migrate to a Kubernetes orchestration platform for better scalability and resilience.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 4.months,
  organization: org1,
  parent_goal: ig1_sg2_org1
)

# --- Organization 2: Data-Driven Decisions LLC ---

# Strategic Goal 1
sg1_org2 = Goal.create!(
  name: "Become the Market Leader in Predictive Analytics",
  description: "Capture the largest market share in the predictive analytics space within three years.",
  goal_type: :strategic,
  status: :active,
  target_date: Date.today + 3.years,
  organization: org2
)

# Intermediate Goal for SG1
ig1_sg1_org2 = Goal.create!(
  name: "Expand into Two New Vertical Markets",
  description: "Adapt and launch our product for the healthcare and finance sectors.",
  goal_type: :intermediate,
  status: :active,
  target_date: Date.today.next_year,
  organization: org2,
  parent_goal: sg1_org2
)

# Immediate Tactical Goals for IG1
itg1_ig1_org2 = Goal.create!(
  name: "Develop HIPAA Compliant Data-Handling Module",
  description: "Ensure our product meets all regulatory requirements for handling sensitive health information.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 6.months,
  organization: org2,
  parent_goal: ig1_sg1_org2
)

itg2_ig1_org2 = Goal.create!(
  name: "Launch Targeted Marketing Campaign for Financial Sector",
  description: "Create and execute a marketing campaign to build brand awareness and generate leads in the financial services industry.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 4.months,
  organization: org2,
  parent_goal: ig1_sg1_org2
)

# Strategic Goal 2
sg2_org2 = Goal.create!(
  name: "Improve Operational Efficiency by 25%",
  description: "Optimize internal processes to reduce costs and improve margins.",
  goal_type: :strategic,
  status: :active,
  target_date: Date.today.next_year,
  organization: org2
)

# Intermediate Goal for SG2
ig1_sg2_org2 = Goal.create!(
  name: "Automate Customer Onboarding",
  description: "Reduce manual effort and time required to onboard new customers.",
  goal_type: :intermediate,
  status: :active,
  target_date: Date.today + 9.months,
  organization: org2,
  parent_goal: sg2_org2
)

# Immediate Tactical Goals for IG1_SG2
itg1_ig1_sg2_org2 = Goal.create!(
  name: "Implement a Self-Service Setup Wizard",
  description: "Build a wizard that guides new users through the initial setup and configuration of their account.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 5.months,
  organization: org2,
  parent_goal: ig1_sg2_org2
)

itg2_ig1_sg2_org2 = Goal.create!(
  name: "Integrate with Major CRM Platforms",
  description: "Develop integrations with Salesforce and HubSpot to streamline data import for new customers.",
  goal_type: :immediate_tactical,
  status: :active,
  target_date: Date.today + 6.months,
  organization: org2,
  parent_goal: ig1_sg2_org2
)

puts "Linking Goals to KVMs..."
GoalKvm.create!(goal: itg1_ig1_org1, kvm: kvm2_org1) # Reduce UI Latency -> Lead Time to Deploy
GoalKvm.create!(goal: itg2_ig1_org1, kvm: kvm3_org1) # Implement Features -> Feature Adoption Rate
GoalKvm.create!(goal: itg1_ig1_org2, kvm: kvm3_org2) # Develop HIPAA Module -> Market Share Growth
GoalKvm.create!(goal: itg2_ig1_sg2_org2, kvm: kvm2_org2) # Integrate with CRM -> Cycle Time
GoalKvm.create!(goal: sg1_org1, kvm: kvm1_org1) # Increase Customer Value -> CSAT

puts "Creating Experiments..."
# Experiment for Agile Innovators Inc. - "Reduce UI Latency" Goal
exp1 = Experiment.create!(
  name: "Frontend Asset Caching Strategy",
  hypothesis: "By implementing aggressive browser and CDN caching for our static assets, we can reduce page load times by 10% and improve UI responsiveness, thus decreasing UI latency.",
  actions_taken: "Configured Cloudflare CDN with new caching rules. Updated webpack to include content hashes in filenames.",
  start_date: DateTime.now - 7.days,
  end_date: DateTime.now + 23.days,
  status: :running,
  inspection_summary: "Initial measurements show a 5% improvement in load times. More data needed.",
  adaptation_summary: "Plan to tweak CDN settings next week to cache HTML content for short periods.",
  goal: itg1_ig1_org1
)

# Experiment for Agile Innovators Inc. - "Implement Top 3 Requested Features" Goal
exp2 = Experiment.create!(
  name: "A/B Test New Dashboard Widget",
  hypothesis: "Introducing a new 'Quick Actions' widget on the main dashboard for a segment of users will lead to a 15% increase in feature adoption for those actions.",
  actions_taken: "Developed the widget and deployed it behind a feature flag. Enabled for 50% of new sign-ups.",
  start_date: DateTime.now - 2.days,
  status: :running,
  goal: itg2_ig1_org1
)

# Experiment for Data-Driven Decisions LLC - "Develop HIPAA Compliant Module" Goal
exp3 = Experiment.create!(
  name: "Prototype Data Anonymization Service",
  hypothesis: "Building a microservice for data anonymization will allow us to securely handle PHI and meet HIPAA requirements, unblocking our entry into the healthcare market.",
  actions_taken: "Researched various anonymization techniques. Started development on a PoC using Python and Faker.",
  start_date: DateTime.now,
  status: :planned,
  goal: itg1_ig1_org2
)


puts "Creating Measurements..."
# Measurements for Experiment 1
Measurement.create!(value: 120.50, measurement_date: DateTime.now - 6.days, notes: "Baseline measurement before caching.", kvm: kvm2_org1, experiment: exp1)
Measurement.create!(value: 115.20, measurement_date: DateTime.now - 3.days, notes: "Post-deployment of CDN rules.", kvm: kvm2_org1, experiment: exp1)
Measurement.create!(value: 110.75, measurement_date: DateTime.now - 1.day, notes: "After webpack changes.", kvm: kvm2_org1, experiment: exp1)

# Measurements for Experiment 2
Measurement.create!(value: 5.0, measurement_date: DateTime.now - 1.day, notes: "Adoption rate for control group.", kvm: kvm3_org1, experiment: exp2)
Measurement.create!(value: 8.2, measurement_date: DateTime.now - 1.day, notes: "Adoption rate for test group with widget.", kvm: kvm3_org1, experiment: exp2)

puts "Seed data created successfully!"
