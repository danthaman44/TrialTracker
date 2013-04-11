class HomeController < ApplicationController

  def removeFriend
    @friendtrial = Trial.find(params[:id])
    @friendtrial.users.delete(User.find params[:frienduser])
    redirect_to :action => 'index'
  end

  def invite
    @ctrial = session[:current_trial]
    @fuser = User.where("username = '#{params[:frienduser]}'").first
    if (@fuser == nil)
      session[:inviteerror] = "User #{params[:frienduser]} does not exist"
    else
      UserMailer.invite_email(@fuser, @ctrial)
    end
    session[:current_tab] = 'settings'
    redirect_to :action => 'index'
  end

  def login 
    @users = User.all
    cuser = params[:email]
    logger.info("person trying to log in: ")
    logger.info(cuser)
    cpass = params[:password]
    cdigest = Digest::SHA2.hexdigest(cpass)
    found = 0
    @users.each do |u|
      logger.info("user")
      logger.info(u.username)
      if (u.email == cuser && u.password == cdigest) || (u.username == cuser && u.password == cdigest)
        logger.info("found matching user")
        logger.info(u.username)
        logger.info(u.id)
        session[:username] = u.username
        session[:userID] = u.id
        found = 1
        redirect_to :action => 'index'
        break
      end
    end
    
    if found == 0
      session[:errormessage] = 'Username/password is incorrect!'
      redirect_to :back
    end
  end

  def logout
    logger.info("Logging out") 
    session[:username] = nil
    session[:userID] = nil
    session[:connections] = nil
    session[:current_tab] = nil
    session[:current_trial] = nil

      redirect_to splashes_path
  end

  def register
      session[:current_trial] = 1
      @title = 'Website Example -- Register Page'
      user = params[:username]
      passwd = params[:password]
      verify = params[:verify]
      email = params[:email]
      if !user.blank? && !User.exists?(user) && passwd == verify
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
          redirect_to :action => 'index'
      else
          redirect_to :back
      end
  end

  def index  
    session[:current_trial] = 1
    if session[:userID] == nil
      logger.info("Not logged in, redirecting") 
      logger.info(splashes_path)
      redirect_to splashes_path
    else

      @user = User.find(session[:userID])
      logger.info("my status:")
      if @user.activated != true
        logger.info("not activated!")
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
          flash[:notice] = "You currently don't have any trials. Click 'New Trial' to make one or join one"
        end 
    else
       @current_trial = Trial.find(session[:current_trial])
    end


  if (@current_trial != nil)
      logger.info("current trial: ")
      logger.info(@current_trial.trialName)  
      @current_crcs = @current_trial.users #the collaborators of our current trial
      logger.info(@current_crcs)
  
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
  def Show
    @data = [["harry", 10], ["sue", 19]]

    respond_to do |format|
      format.js
    end
  end

 
  def insert_trials
      logger.info("****** Inserting Trials! ******")
      Trial.create(:description => 'new', :tdate => 'Friday', :trialName => 'hers')
      Trial.create(:description => 'newer', :tdate => 'Thursday', :trialName => 'yours')
      #// call ashwin's db stuff
      #enrolled = params['enrolled']
      redirect_to "localhost:3000"
      #redirect_to index
   end

   def showSplash 
      redirect_to "localhost:3000"
  
   end


end
