class Entry < ActiveRecord::Base
  attr_accessible :timestamp, :enrolled, :active, :completed, :withdrawn, :refused, :lost

    
end
