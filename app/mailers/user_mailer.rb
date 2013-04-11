class UserMailer < ActionMailer::Base
  default from: "staff@trialtracker.com"

   def welcome_email(user)
    @user = user
    @id = @user.id
    @url  = "trialtracker.herokuapp.com/users/"+@id.to_s+"/activate"
    mail(:to => @user.email, :subject => "Welcome to TrialTracker!")
  end

  def invite_new_user(email, trial)
  end

  def invite_existing_user(userid, trial)
  end

end
