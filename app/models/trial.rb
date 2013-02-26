class Trial < ActiveRecord::Base
  attr_accessible :trialID, :trialName, :endDate, :enrolledGoal, :completedGoal
    
end
