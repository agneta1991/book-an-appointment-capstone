class Doctor < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  # Add 'img' attribute
  attr_accessor :img

  validates :name, presence: true, length: { maximum: 255 }
  validates :specialization, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :years_of_experience, presence: true, numericality: { greater_than: 0 }
end
