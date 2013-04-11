class UserMailer < ActionMailer::Base
  default from: "staff@trialtracker.com"

   def welcome_email(user)
    @user = user
    @url  = "trialtracker.herokuapp.com"
    mail(:to => @user.email, :subject => "Welcome to TrialTracker!")
  end

  def invite_email(user, ctr)
    @ctrial = ctr
    @fuser = user
    @url = "trialtracker.herokuapp.com"
    mail(:to => @fuser.email, :subject => "A fellow CRC has invited you to a Trial")
  end

end
