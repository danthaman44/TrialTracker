# Created by Sean Miller, Dan Deng, Ashwinn Sundar
class Connections < ActiveRecord::Base
  attr_accessible :acceptinguser, :invitinguser, :status, :trialID
end
