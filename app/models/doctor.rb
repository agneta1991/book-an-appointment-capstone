class Doctor < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  # Add 'img' attribute
  attr_accessor :img
end
