class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  has_many :dependent_association

  validates :user, presence: true
  validates :date, presence: true
end
