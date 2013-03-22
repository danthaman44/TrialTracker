class TrialsController < ApplicationController
  # GET /trials
  # GET /trials.json
  def index
    @trials = Trial.all
    @trial = Trial.new

    respond_to do |format|
      format.html # index.html.erb
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

  # GET /trials/1/edit
  def edit
    @trial = Trial.find(params[:id])
  end

  # POST /trials
  # POST /trials.json
  def create
    @trial = Trial.new(params[:trial])
    respond_to do |format|
      if @trial.save
        entry = @trial.entries.create(:input_at => Time.now, :enrolled => 0, :active => 0, :completed => 0, :withdrawn => 0, :refused => 0,:lost => 0, :trial_id => @trial.id)
        #@trial.users << @current_crc
        user = @trial.users.create(:username => "newguy", :password => "pw", :email => "email@gmail.com")
        session[:current_trial] = session[:current_trial] + 1
        # format.html { redirect_to @trial, notice: 'Trial was successfully created.' }
        format.json { render json: @trial, status: :created, location: @trial }
        format.html {redirect_to :back }
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
    respond_to do |format|
      if @trial.update_attributes(params[:trial])
        format.html { redirect_to :controller => 'home', :action => 'index'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trial = Trial.find(params[:id])
    @trial.destroy

    respond_to do |format|
      format.html { redirect_to trials_url }
      format.html { redirect_to "localhost:3000" }
      format.json { head :no_content }
    end
  end
end
