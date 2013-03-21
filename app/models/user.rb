class User < ActiveRecord::Base
  attr_accessible :password, :username, :email, :trial_id
  belongs_to :trial
end
