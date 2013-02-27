class CreateSplashes < ActiveRecord::Migration
  def change
    create_table :splashes do |t|

      t.timestamps
    end
  end
end
