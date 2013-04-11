class Entry < ActiveRecord::Base
  attr_accessible :input_at, :enrolled, :active, :completed, :withdrawn, :refused, :lost, :trial_id
  belongs_to :trial
  

    
end
