class User < ActiveRecord::Base
  attr_accessible :password, :username, :email, :trial_id
  has_and_belongs_to_many :trials
end
