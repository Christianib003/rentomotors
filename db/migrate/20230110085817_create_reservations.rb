class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.date :reserved_from 
      t.date :reserved_until
      t.timestamps
    end
  end
end
