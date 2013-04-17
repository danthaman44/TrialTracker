#Sean Miller, Dan Deng, Ash Sundar 
# This class contains all methods used from the main page. 

class HomeController < ApplicationController

  def removeFriend 
    @friendtrial = Trial.find(params[:id])
    @friendtrial.users.delete(User.find params[:frienduser])
    redirect_to :action => 'index'
  end

  def invite #allows the owner of trial to invite another use to join the trial
    @trial = session[:current_trial]
    @user = User.where(:email => params[:email]).first
    if (@user == nil)
      UserMailer.invite_new_user(params[:email], @trial).deliver
    else
      UserMailer.invite_existing_user(@user, @trial).deliver
    end
    session[:invitemessage] = "#{params[:email]}"
    session[:current_tab] = 'settings'
    redirect_to :action => 'index'
  end

  def login #when a user logs in the splash page
    @users = User.all
    cuser = params[:email]
    logger.info("person trying to log in: ")
    logger.info(cuser)
    cpass = params[:password]
    cdigest = Digest::SHA2.hexdigest(cpass)
    found = 0
    @users.each do |u|

      if (u.email == cuser && u.password == cdigest) || (u.username == cuser && u.password == cdigest) #verfies the current uses email and password
        if u.activated != true
          session[:loginError] = "unactivated"
        logger.info("not activated!")
        found = 1
        redirect_to '/loginError'
        break
        end
        logger.info("found matching user")
        logger.info(u.username)
        session[:username] = u.username
        session[:userID] = u.id
        found = 1
        redirect_to :action => 'index'
        break
      end
    end
      
    if found == 0
      session[:loginError] = "wrongPassword"
      redirect_to '/loginError'

    end
  end

  def logout #when the user logs out, all session are reset
    logger.info("Logging out") 
    session[:username] = nil
    session[:userID] = nil
    session[:connections] = nil
    session[:current_tab] = nil
    session[:current_trial] = nil
    redirect_to splashes_path
  end

  def register #creates a new user object
      session[:current_trial] = 1
      @title = 'Website Example -- Register Page'
      user = params[:username]
      passwd = params[:password]
      verify = params[:verify]
      email = params[:email]
      if email == ''                      # Some basic validation of the user. This should really be done in the model...
        session[:registererror] = "noEmail"
        redirect_to splashes_path
      elsif user == ''
        session[:registererror] = "noUsername"
        redirect_to splashes_path
      elsif passwd != verify
        session[:registererror] = "passwordMismatch"
        redirect_to splashes_path
      else 
        User.all.each do |u|
          if u.email == email
            session[:registererror] = "doubleEmail"
            redirect_to splashes_path
            return
          end
        end
          login = User.new
          login.username = user
          login.activated = false
          hash = Digest::SHA2.hexdigest(passwd)
          login.password = hash
          login.email= email
          login.save
          session[:username] = user
          session[:userID] = login.id
          UserMailer.welcome_email(login).deliver
          session[:loginError] = "registered"
          redirect_to '/loginError'
      end
  end

  def index  #runs automatically on page load. Loads all the graphs and other content. Also redirects to splash page if user is not logged in
    #reset_session
    if session[:userID] == nil #checks if a user is logged in
      logger.info("Not logged in, redirecting") 
      logger.info(splashes_path)
      redirect_to splashes_path
    else

      @user = User.find(session[:userID])

      if @user.activated != true #the user has not validated their account through email
        logger.info("account not activated!")
        redirect_to splashes_path
      end
      logger.info("Logged in as ")
      logger.info(@user.username)
      @trials = @user.trials
      logger.info(@trials)

    if session[:current_trial] == nil
        logger.info("logging in, viewing first trial")
        if @trials.length > 0
          @current_trial = @trials[0] # the trial displayed first by default
          session[:current_trial] = @current_trial.id
        else
          @current_trial = nil
          flash[:notice] = "You currently don't have any trials. Click 'Add Trial' to make one or join one"
        end 
    else
       @current_trial = Trial.find(session[:current_trial])
    end

  if (@current_trial != nil) #the following code is used for generating the graphs
      logger.info("current trial: ")
      logger.info(@current_trial.trialName)  
      @current_crcs = @current_trial.users #the collaborators of our current trial
      logger.info("owner: ")
      logger.info(@current_trial.userowner)
  
      entries = @current_trial.entries
      @entries_recentFirst = entries.sort { |a, b| b.input_at <=> a.input_at }
      #(:all, :order => "input_at DESC")
      @entries_oldestFirst = entries.sort { |a, b| a.input_at <=> b.input_at }
      @last_entry = @entries_recentFirst[0]

      
      @categories = ["enrolled", "active", "completed", "withdrawn", "refused", "lost"]
      @averages = Hash.new

      length_of_trial = @last_entry.input_at - @entries_oldestFirst[0].input_at # length of trial SO FAR
      @total_length_of_trial = @current_trial.endDate - @entries_oldestFirst[0].input_at

      if length_of_trial == 0
        length_of_trial = 1
      end
      if @total_length_of_trial ==0
        @total_length_of_trial = 1
      end

      @categories.each do |category|
        @averages[category] = @last_entry[category]/length_of_trial
      end

      @targetAverages = Hash.new

      @enrolledAverage = @current_trial.enrolledGoal/@total_length_of_trial
      @completedAverage = @current_trial.completedGoal/@total_length_of_trial

      @targetAverages['enrolled'] = @enrolledAverage
      @targetAverages['completed'] = @completedAverage
      @targetAverages['active'] = 0
      @targetAverages['withdrawn'] = 0
      @targetAverages['refused'] = 0
      @targetAverages['lost'] = 0
    logger.info(@targetAverages)
  end
    #totals_by_week is a Hash of the form:
    # {'enrolled'=> [:entry => 12, :entry => 23], 'active'=> [:entry=> 11, :entry=>20]}
    #totals is a Hash of the form:
    # {'enrolled': 33, 'active': 31}

    if session[:current_tab] == nil
      session[:current_tab] = 'edit_data'
    end
    logger.info(session[:current_tab])

    @entry = Entry.new # Used in edit data form
    @entry2 = Entry.new
    @trial = Trial.new # Used in modal form
  end
      
  end


   def forgotPassword
    email = params[:email]
    logger.info(email)
    User.all.each do |u|
      logger.info(u.email)
      if (u.email == email)
        newPassword = rand(100000)
        u.update_attributes({:password => newPassword})
        # send email giving them newPassword
        session[:loginError] = "newPassword"
        logger.info("###################sending email#******************")
        break
      else
        session[:loginError] = "newPasswordwrongEmail"
      end
      
    end
    redirect_to '/loginError'
  end



end
