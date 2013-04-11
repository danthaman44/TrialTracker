class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :trial_id
      t.boolean :activated :default => false
      t.timestamps
    end
  end
end
