class Experiment < ApplicationRecord
  belongs_to :goal
  has_many :measurements, dependent: :nullify

  # To define statuses
  enum :status, {
    planned: "Planned",
    running: "Running",
    completed: "Completed",
    cancelled: "Cancelled"
  }
end
