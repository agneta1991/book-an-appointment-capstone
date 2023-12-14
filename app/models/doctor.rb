class Doctor < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy, foreign_key: :doctor_id

  has_many_attached :images

  validates :name, presence: true, length: { maximum: 255 }
  validates :specialization, presence: true, length: { maximum: 255 }
  validates :price_per_appointment, presence: true, numericality: { greater_than: 0 }
  validates :years_of_experience, presence: true, numericality: { greater_than: 0 }
end
