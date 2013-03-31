class UserMailer < ActionMailer::Base
  default from: "staff@trialtracker.com"

   def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => @user.email, :subject => "Welcome to My Awesome Site").deliver
  end
end
