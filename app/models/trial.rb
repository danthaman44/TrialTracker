class Trial < ActiveRecord::Base
  attr_accessible :trialID, :trialName, :endDate, :startDate, :enrolledGoal, :completedGoal, :entries_attributes
  has_many :entries, :autosave => true
  accepts_nested_attributes_for :entries
  has_many :users, :autosave => true
  accepts_nested_attributes_for :users

    
end
