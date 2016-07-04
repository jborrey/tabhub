class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, limit: 24
      t.string :email

      t.timestamps null: false
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
