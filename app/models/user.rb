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


  def update_password(oldpw, newpw, confirm)
    if (oldpw == nil || newpw == nil || confirm == nil)
       return false
    end
    logger.info("old" + oldpw)
    logger.info("new" + newpw)
    logger.info("confirm" + confirm)
    logger.info("enter update method")
    hashold = Digest::SHA2.hexdigest(oldpw)
    hashnew = Digest::SHA2.hexdigest(newpw)
    if self.password != hashold #user did not type in the correct original pw
       puts "old pw wrong"
       logger.info("old pw wrong")
       return false
    end
    if newpw != confirm #users confirm pw did not match
       puts "passwords dont match"
       logger.info("pw dont match")
       return false
    end
    logger.info("method change success!")
    puts "changing pw"
    update_attributes(:password => hashnew)
    return true
  end
 
end
