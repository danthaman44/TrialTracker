class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :username, :email, :trial_id, :remember_me, :activated
  has_and_belongs_to_many :trials

  validates :username, :uniqueness => true

  def activate?
    update_attributes(:activated => true)
    if self.activated
      return true
    else
      return false
    end
  end
 
end
