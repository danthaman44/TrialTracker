
class HomeController < ApplicationController
  def index
      @trial = Trial.new
      @trials = Trial.all
      @entries_recentFirst = Entry.find(:all, :order => "input_at DESC")
      @entries_oldestFirst = Entry.find(:all, :order => "input_at")
      @last_entry = @entries_recentFirst[0]

      
      logger.info("first trial:")
      if @first_trial == nil
          @first_trial = @trials[0] # the trial displayed first by default
      end
      logger.info(@first_trial)
      logger.info(@first_trial.enrolledGoal)
      logger.info(@first_trial.endDate)


      @categories = ["enrolled", "active", "completed", "withdrawn", "refused", "lost"]
      @averages = Hash.new

      length_of_trial = @last_entry.input_at - @entries_oldestFirst[0].input_at # length of trial SO FAR
      @total_length_of_trial = @first_trial.endDate - @entries_oldestFirst[0].input_at

      @categories.each do |category|
        @averages[category] = @last_entry[category]/length_of_trial
      end

      @targetAverages = Hash.new

      @enrolledAverage = @first_trial.enrolledGoal/@total_length_of_trial
      @completedAverage = @first_trial.completedGoal/@total_length_of_trial

      @targetAverages['enrolled'] = @enrolledAverage
      @targetAverages['completed'] = @completedAverage
      @targetAverages['active'] = 0
      @targetAverages['withdrawn'] = 0
      @targetAverages['refused'] = 0
      @targetAverages['lost'] = 0
    logger.info(@targetAverages)

    #totals_by_week is a Hash of the form:
    # {'enrolled'=> [:entry => 12, :entry => 23], 'active'=> [:entry=> 11, :entry=>20]}
    #totals is a Hash of the form:
    # {'enrolled': 33, 'active': 31}

    @entry = Entry.new # Used in edit data form
    @trial = Trial.new # Used in modal form
      
  end
  def Show
    @data = [["harry", 10], ["sue", 19]]

    respond_to do |format|
      format.js
    end
  end


  def change_trial
    @trials = Trial.all
    id = params[:id]
    @first_trial = @trials[id]
    logger.info(@first_trial.trialName)
    redirect_to "localhost:3000"
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
