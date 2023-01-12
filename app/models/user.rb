class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :cars

  validates :name,
            length: { minimum: 3, message: 'fields can not be less than 3 letters' }, presence: true
  validates :email,
            uniqueness: true, presence: true
  validates :encrypted_password,
            length: { minimum: 6, message: 'can not be less than 6 characters' }, presence: true
  validates :username,
            length: { minimum: 6, message: 'can not be less than 6 characters' }, presence: true
end
