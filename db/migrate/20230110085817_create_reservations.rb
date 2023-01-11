class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.reserved_from :date
      t.reserved_until :date
      t.timestamps
    end
  end
end
