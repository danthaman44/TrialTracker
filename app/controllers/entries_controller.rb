class EntriesController < ApplicationController
	def new
		@entry = Entry.new :input_at => Date.current()
	end

	def create
    
    logger.info("--------") 
    logger.info(params[:entry])
    logger.info(params[:entry]["enrolled"])
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

  def update


  end

  def show
    logger.info (params[:toDelete])
    logger.info (params[:toDelete])
    #params[:toDelete].delete_all;
    s = Entry.where("id = ?", params[:toDelete])
    logger.info ("------------------------------")
    logger.info (s)
    s.delete_all
    redirect_to 'localhost:3000'
  end
end
