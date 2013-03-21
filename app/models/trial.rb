class Trial < ActiveRecord::Base
  attr_accessible :trialID, :trialName, :endDate, :enrolledGoal, :completedGoal, :entries_attributes
  has_many :entries
  accepts_nested_attributes_for :entries
  has_many :users
  accepts_nested_attributes_for :users

    
end
