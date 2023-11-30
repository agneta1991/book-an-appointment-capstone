class Doctor < ApplicationRecord
  belons_to :user
  has_many :reservations
end
