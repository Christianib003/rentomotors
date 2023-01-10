class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password, default: 'password'
      t.string :email, unique: true
      t.string :name, default: 'user'

      t.timestamps
    end
  end
end
