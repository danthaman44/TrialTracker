class UserMailer < ActionMailer::Base
  default from: "staff@trialtracker.com"

   def welcome_email(user)
    @user = user
    @id = @user.id
    @url  = "trialtracker.herokuapp.com/users/"+@id+"/activate"
    mail(:to => @user.email, :subject => "Welcome to TrialTracker!")
  end
end
