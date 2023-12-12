class Doctor < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  has_one_attached :image

  # Add 'img' attribute
  attr_accessor :image

  validates :name, presence: true, length: { maximum: 255 }
  validates :specialization, presence: true, length: { maximum: 255 }
  validates :price_per_appointment, presence: true, numericality: { greater_than: 0 }
  validates :years_of_experience, presence: true, numericality: { greater_than: 0 }
end
