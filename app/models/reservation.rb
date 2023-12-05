class Reservation < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :doctor, dependent: :destroy
  has_many :dependent_association, dependent: :destroy


  validates :user, presence: true
  validates :date, presence: true
end
