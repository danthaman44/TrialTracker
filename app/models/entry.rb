class Entry < ActiveRecord::Base
  attr_accessible :enrolled, :active, :completed, :withdrawn, :refused, :lost

    
end
