class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :trialName
      t.integer :trialID

      t.timestamps
    end
  end
end
