class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  before_create :generate_authentication_token


  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  attr_accessor :token


  has_many :doctors
  has_many :reservations

  private

  def generate_authentication_token
    self.token = SecureRandom.uuid
  end
end
