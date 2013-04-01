class EntriesController < ApplicationController
  respond_to :html, :json
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
    respond_to do |format|
	     if entry.save
        format.html { redirect_to :controller => 'home', :action => 'index' }  
        format.js
        else
        end
      end
  end

  def edit
logger.info("EDITING AN ENTRY")
  end

  def update
    entry = Entry.find(params[:id])
    params[:entry][:input_at] = Date.strptime(params[:entry][:input_at], '%m/%d/%Y')

    logger.info("UPDATING AN ENTRY")
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

  
  def show # implements delete
    logger.info (params[:id])
    #params[:toDelete].delete_all;
    s = Entry.where("id = ?", params[:id])
    logger.info ("------------------------------")
    logger.info (s)
    s.delete_all

    session[:current_tab] = 'edit_data'
    respond_to do |format|  
      format.html { redirect_to :controller => 'home', :action => 'index' }  
      format.json   { render :nothing => true }  
      end
  end
end
