class Car < ApplicationRecord
  belongs_to :user
  validates :brand, :model, :release_year, :color, :transmission, :seats, :wheel_drive, :price, presence: true
end
