class CreateTrialsUsersTable < ActiveRecord::Migration
  def up
  	create_table :trials_users, :id => false do |t|
  		t.references :trial
  		t.references :user
  end
  add_index :trials_users, [:trial_id, :user_id]
  add_index :trials_users, [:user_id, :trial_id]
end

  def down
  	drop_table :trials_users
  end
end
