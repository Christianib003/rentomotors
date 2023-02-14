class Car < ApplicationRecord
  belongs_to :user
  paginates_per 3
  validates :brand, :model, :release_year, :color, :transmission, :seats, :wheel_drive, :price, presence: true
end
