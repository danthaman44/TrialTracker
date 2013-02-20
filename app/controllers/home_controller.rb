class HomeController < ApplicationController
  def index
      logger.info("testing!")
      puts("testing")

      @t = Trial.all
      
      logger.info(@t)

      @entries = Entry.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @entries }
      end
      logger.info(@entries)
      
  end
  def join_event
      logger.info("******** Joining Event!**********")
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
end
