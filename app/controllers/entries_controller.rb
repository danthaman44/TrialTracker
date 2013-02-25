class EntriesController < ApplicationController
	def new
		@entry = Entry.new
	end

	def create
    
    logger.info("--------Inserting an Entry") 
    logger.info(params[:entry])
    logger.info("test")
    entry = Entry.new
    entry.input_at = Date.current()
    entry.enrolled = params[:entry][:enrolled]
    entry.active = params[:entry][:active]
    entry.completed = params[:entry][:completed]
    entry.withdrawn = params[:entry][:withdrawn]
    entry.refused = params[:entry][:refused]
    entry.lost = params[:entry][:lost]


		
	  if entry.save
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
