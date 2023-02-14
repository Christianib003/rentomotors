class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true, nullable: false
      t.string :encrypted_password, nullable: true
      t.string :email, unique: true, nullable: false
      t.string :name, default: 'user'

      t.timestamps
    end
  end
end
