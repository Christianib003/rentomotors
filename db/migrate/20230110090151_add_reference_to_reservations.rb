class AddReferenceToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :user_id, :integer, foreign_key: true
    add_column :reservations, :car_id, :integer, foreign_key: true
  end
end
