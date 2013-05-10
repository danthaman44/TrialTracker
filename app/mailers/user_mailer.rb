# Created by Sean Miller, Dan Deng, Ashwinn Sundar
# This class enables us to send emails to users
class UserMailer < ActionMailer::Base
  default from: "staff@trialtracker.com"

   def welcome_email(user) #the email recieved when a user registers
    @user = user
    @id = @user.id
    @url  = "trialtracker.herokuapp.com/users/"+@id.to_s+"/activate"
    mail(:to => @user.email, :subject => "Welcome to TrialTracker!")
  end

  def forgot_password (email, password)
    @password = password
    @email = email

    @url = "trialtracker.herokuapp.com"
    mail(:to => @email, :subject => "You new password is "+@password+".Be sure to change your password as
      soon as you log into your account!")
  end

  def invite_new_user(email, trialid) #when a current user invites someone who does not have a trialtracker account
    @trialid = trialid
    @email = email
    @url = "trialtracker.herokuapp.com"
    mail(:to => @email, :subject => "A fellow CRC has invited you to a TrialTracker")
  end

  def invite_existing_user(user, trialid) #when a current user invites someone who does have a trialtracker account
    @trialid = trialid
    @fuser = user
    @url = "trialtracker.herokuapp.com"
    mail(:to => @fuser.email, :subject => "A fellow CRC has invited you to a trial")
  end

end
