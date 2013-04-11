class AddUserownerToTrials < ActiveRecord::Migration
  def change
    add_column :trials, :userowner, :integer
  end
end
