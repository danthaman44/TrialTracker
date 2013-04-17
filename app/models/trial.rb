# Created by Sean Miller, Dan Deng, Ashwinn Sundar
# This class represents the "Trial" object. 

class Trial < ActiveRecord::Base
  attr_accessible :trialID, :trialName, :endDate, :startDate, :enrolledGoal, :completedGoal, :entries_attributes, :userowner
  has_many :entries, :autosave => true #creates a one to many relationship with the the entry object
  accepts_nested_attributes_for :entries
  has_and_belongs_to_many :users, :autosave => true #creates a many to many relationship with the user object
  accepts_nested_attributes_for :users

  validates :trialName, :length => { :minimum=> 1, #redirects user to a validation page if they try to create a trial with no name
    :too_short => "- You must input a trial name" }


end
