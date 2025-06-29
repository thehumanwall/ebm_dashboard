class Organization < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :kvms, dependent: :destroy
end
