class Measurement < ApplicationRecord
  belongs_to :kvm
  belongs_to :experiment, optional: true
end
