class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :trialName
      t.date :endDate
      t.integer :enrolledGoal
      t.integer :completedGoal

      t.timestamps
    end
  end
end
