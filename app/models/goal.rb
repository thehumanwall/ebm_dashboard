class Goal < ApplicationRecord
  belongs_to :organization

  # Establishes the self-referential relationship
  belongs_to :parent_goal, class_name: "Goal", optional: true
  has_many :child_goals, class_name: "Goal", foreign_key: "parent_goal_id", dependent: :destroy

  has_many :goal_kvms, dependent: :destroy
  has_many :kvms, through: :goal_kvms
  has_many :experiments, dependent: :nullify

  # To define the goal types in the model
  enum :goal_type, {
    strategic: "Strategic",
    intermediate: "Intermediate",
    immediate_tactical: "Immediate Tactical"
  }

  # To define statuses
  enum :status, {
    active: "Active",
    achieved: "Achieved",
    archived: "Archived"
  }
end
