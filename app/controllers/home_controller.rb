class HomeController < ApplicationController
  def index

      @t = Trial.all
      @entries = Entry.all
      @entry = Entry.new

      @categories = ["enrolled", "active", "completed", "withdrawn", "refused", "lost"]
      @totals = Hash.new
      @totals_by_week = Hash.new

      @categories.each do |category|
        total = 0
        @totals_by_week[category] = []
        @entries.each do |entry|
          total = total + entry[category]
          @totals_by_week[category] << {entry.input_at => total}
          logger.info('*********************')
          logger.info(@totals_by_week[category])
          logger.info('*********************')
        end
        @totals[category] = total
      end
    logger.info(@totals)
    logger.info(@totals_by_week)

    #totals_by_week is a Hash of the form:
    # {'enrolled'=> [:entry => 12, :entry => 23], 'active'=> [:entry=> 11, :entry=>20]}
    #totals is a Hash of the form:
    # {'enrolled': 33, 'active': 31}

      
      
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
end
