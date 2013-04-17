# Created by Sean Miller, Dan Deng, Ashwinn Sundar
# This is the "user" object. Each CRC that registers will create an instance of a user
# This how individual accounts are supported

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :username, :email, :trial_id, :remember_me, :activated
  has_and_belongs_to_many :trials #many to many relation with trials

  validates :username, :uniqueness => true #two users can not have the same username

  def activate? #activates the users account once they have registered
    update_attributes(:activated => true)
    if self.activated
      return true
    else
      return false
    end
  end
 
end
