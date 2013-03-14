class Connections < ActiveRecord::Base
  attr_accessible :acceptinguser, :invitinguser, :status, :trialID
end
