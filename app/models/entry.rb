# Created by Sean Miller, Dan Deng, Ashwinn Sundar
# this class represents the "entry" object. Each entry corresponds to a row in our
# "Edit Data" page

class Entry < ActiveRecord::Base
  attr_accessible :input_at, :enrolled, :active, :completed, :withdrawn, :refused, :lost, :trial_id #these are class variables
  belongs_to :trial #this creates the relation between entries and trials in the database
  

    
end
