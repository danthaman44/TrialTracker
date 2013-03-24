class Trial < ActiveRecord::Base
  attr_accessible :trialID, :trialName, :endDate, :enrolledGoal, :completedGoal, :entries_attributes
  has_many :entries, :autosave => true
  accepts_nested_attributes_for :entries
  has_many :users, :autosave => true
  accepts_nested_attributes_for :users

  validates :trialName, :trialID, :presence => true

    
end
