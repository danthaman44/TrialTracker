class Trial < ActiveRecord::Base
  attr_accessible :trialID, :trialName, :endDate, :startDate, :enrolledGoal, :completedGoal, :entries_attributes, :userowner
  has_many :entries, :autosave => true
  accepts_nested_attributes_for :entries
  has_and_belongs_to_many :users, :autosave => true
  accepts_nested_attributes_for :users

  validates :trialName, :length => { :minimum=> 1,
    :too_short => "- You must input a trial name" }


end
