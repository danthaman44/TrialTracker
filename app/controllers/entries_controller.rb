class EntriesController < ApplicationController
	def new
		
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
    entry.trial_id = params[:entry][:trial_id]


		session[:current_tab] = 'edit_data'
	  if entry.save
      redirect_to :controller => 'home', :action => 'index'
        #format.html { redirect_to @home, :notice => 'Article was successfully created.' }
        #format.json { render :json => @article, :status => :created, :location => @article }
      else
        #format.html { render :action => "new" }
        #format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
  end

  def update
    entry = Entry.find(params[:toUpdate])
    session[:current_tab] = 'edit_data'

    respond_to do |format|
      if entry.update_attributes(params[:entry])
        format.html { redirect_to :controller => 'home', :action => 'index' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    logger.info (params[:toDelete])
    logger.info (params[:toDelete])
    #params[:toDelete].delete_all;
    s = Entry.where("id = ?", params[:toDelete])
    logger.info ("------------------------------")
    logger.info (s)
    s.delete_all

    session[:current_tab] = 'edit_data'
    redirect_to :controller => 'home', :action => 'index'
  end
end
