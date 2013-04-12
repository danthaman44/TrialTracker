class UserMailer < ActionMailer::Base
  default from: "staff@trialtracker.com"

   def welcome_email(user)
    @user = user
    @id = @user.id
    @url  = "trialtracker.herokuapp.com/users/"+@id.to_s+"/activate"
    mail(:to => @user.email, :subject => "Welcome to TrialTracker!")
  end

  def invite_new_user(email, trialid)
    @trialid = trialid
    @email = email
    @url = "trialtracker.herokuapp.com"
    mail(:to => @email, :subject => "A fellow CRC has invited you to a TrialTracker")
  end

  def invite_existing_user(user, trialid)
    @trialid = trialid
    @fuser = user
    @url = "trialtracker.herokuapp.com"
    mail(:to => @fuser.email, :subject => "A fellow CRC has invited you to a trial")
  end

end
