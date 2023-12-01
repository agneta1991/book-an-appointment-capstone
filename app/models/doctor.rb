class Doctor < ApplicationRecord
  belongs_to :user
  has_many :reservations

  # Add 'img' attribute
  attr_accessor :img
end
