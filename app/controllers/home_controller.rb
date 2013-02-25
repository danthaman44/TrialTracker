class HomeController < ApplicationController
  def index

      @t = Trial.all
      @entries = Entry.all
      @entry = Entry.new

      @categories = ["enrolled", "active", "completed", "withdrawn", "refused", "lost"]
      @totals = Hash.new
      @categories.each do |category|
        total = 0
        @entries.each do |entry|
          total = total + entry[category]
        end
        @totals[category] = total
      end
logger.info(@totals)

      
      
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
