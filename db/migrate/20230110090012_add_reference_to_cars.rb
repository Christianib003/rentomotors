class AddReferenceToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :user_id, :integer, foreign_key: true
  end
end
