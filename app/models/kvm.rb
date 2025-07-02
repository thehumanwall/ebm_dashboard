class Kvm < ApplicationRecord
  belongs_to :organization
  belongs_to :kva

  has_many :goal_kvms, dependent: :destroy
  has_many :goals, through: :goal_kvms
  has_many :measurements, dependent: :destroy
end
