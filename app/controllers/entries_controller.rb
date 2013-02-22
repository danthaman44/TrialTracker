class EntriesController < ApplicationController
	def new
		@entry = Entry.new
	end
	def create
    
logger.info(params[:entry])
logger.info(params["enrolled"])
logger.info("test")
@entry = Entry.new(params[:entry])
		
	  if @entry.save
      redirect_to 'localhost:3000'
        #format.html { redirect_to @home, :notice => 'Article was successfully created.' }
        #format.json { render :json => @article, :status => :created, :location => @article }
      else
        #format.html { render :action => "new" }
        #format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
  end
end
