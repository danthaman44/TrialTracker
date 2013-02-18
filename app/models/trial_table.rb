class TrialTable < ActiveRecord::Base
  attr_accessible :crcName, :enrolled, :lost, :pID, :refused, :trialName, :vulnerable, :withdrawn
end
