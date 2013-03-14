class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :acceptinguser
      t.string :invitinguser
      t.string :status
      t.integer :trialID

      t.timestamps
    end
  end
end
