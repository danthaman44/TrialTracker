class UserMailer < ActionMailer::Base
  default from: "staff@trialtracker.com"

   def welcome_email(user)
    @user = user
    @url  = "trialtracker.herokuapp.com"
    mail(:to => @user.email, :subject => "Welcome to TrialTracker!")
  end
end
