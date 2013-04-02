class TrialsController < ApplicationController
  # GET /trials
  # GET /trials.json
  def index
    @trials = Trial.all
    @trial = Trial.new
    respond_to do |format|
      format.html {redirect_to :controller => 'home', :action => 'index' }
      format.json { render json: @trials }
    end
  end

  # GET /trials/1
  # GET /trials/1.json
  def show
    @trial = Trial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trial }
    end
  end

  # GET /trials/new
  # GET /trials/new.json
  def new
    @trial = Trial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trial }
    end
  end

  def join
    @trial = Trial.find(params[:trial_id])
    if @trial == nil
      logger.info("Trial doesn't exist")
      # do something
    else
      user = User.find session[:userID]
      @trial.users << user
      session[:current_trial] = @trial.id
      respond_to do |format|
      format.html { redirect_to :controller => 'home', :action => 'index' }
      format.json { head :no_content }
     end
    end

  end

  # GET /trials/1/edit
  def edit
    @trial = Trial.find(params[:id])
  end

  # POST /trials
  # POST /trials.json
  def create
    @trial = Trial.new(params[:trial])
    if @trial.enrolledGoal == nil
      @trial.enrolledGoal = 0
    end 
    if @trial.trialID == nil
      @trial.trialID = 0
    end
    if @trial.completedGoal == nil
      @trial.completedGoal = 0
    end 
    logger.info(@trial.endDate)

    @trial.endDate = Date.strptime(params[:trial][:endDate], '%m/%d/%Y') + 1.year


    @trial.startDate = Date.strptime(params[:trial][:startDate], '%m/%d/%Y')


    respond_to do |format|
      if @trial.save
        entry = @trial.entries.create(:input_at => Time.now, :enrolled => 0, :active => 0, :completed => 0, :withdrawn => 0, :refused => 0,:lost => 0, :trial_id => @trial.id)
        #@trial.users << @current_crc
        @trial.users << @user = User.find(session[:userID])
       
        session[:current_trial] = @trial.id
        logger.info("our current session, create")
        logger.info(session[:current_trial])
        # format.html { redirect_to @trial, notice: 'Trial was successfully created.' }
        format.json { head :no_content }
        format.html {redirect_to :controller => 'home', :action => 'index' }
      else
        format.html { render action: "new" }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_trial

    session[:current_trial] = Trial.find(params[:id]).id
    current = session[:current_trial] 
    logger.info("current trial: ")
    logger.info(current)
    respond_to do |format|
      format.html { redirect_to :controller => 'home', :action => 'index'}
      format.json { head :no_content } 
    end
  end

  # PUT /trials/1
  # PUT /trials/1.json
  def update
    @trial = Trial.find(params[:id])

    session[:current_tab] = 'settings'
    params[:trial][:startDate] = Date.strptime(params[:trial][:startDate], '%m/%d/%Y')
    params[:trial][:endDate] = Date.strptime(params[:trial][:endDate], '%m/%d/%Y')

    respond_to do |format|
      if @trial.update_attributes(params[:trial])
        format.html { redirect_to :controller => 'home', :action => 'index'}
        format.json { head :no_content }
      else
        flash[:nameerror] = 'You must have a Trial Name!'
        format.html {redirect_to :back} #{ render action: "edit" }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trial = Trial.find(params[:id])
    @trial.users.delete(User.find session[:userID])
    logger.info(@trial.users)
    session[:current_trial] = nil
    respond_to do |format|
      format.html { redirect_to :controller => 'home', :action => 'index' }
      format.json { head :no_content }
    end
  end
end
