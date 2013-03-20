class AddUserownerToTrials < ActiveRecord::Migration
  def change
    add_column :trials, :userowner, :string
  end
end
