class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer  :enrolled
    t.integer  :active
    t.integer  :completed
    t.integer  :withdrawn
    t.integer  :refused
    t.integer  :lost
    t.integer :trial_id
    t.date :input_at

    t.timestamps
    end
  end
end
