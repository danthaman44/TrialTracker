#Sean Miller, Dan Deng, Ash Sundar 
# This class contains all the methods associated with
#creating, destroying, displaying, and modifying an entry object

class EntriesController < ApplicationController
  respond_to :html, :json
	def new
		
	end



	def create #creates a new entry object in db
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

    oldEntry = Entry.where(:input_at => Date.current(), :trial_id => params[:entry][:trial_id]).first
    if oldEntry != nil
      logger.info("We have an entry with this date")
      oldEntry.destroy
    end
		session[:current_tab] = 'edit_data'
    respond_to do |format|
	    if entry.save
        format.html { redirect_to :controller => 'home', :action => 'index'}  
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }   
      end
    end
  end

  def edit
logger.info("EDITING AN ENTRY")
  end

  def update #updates and entry in the db
    entry = Entry.find(params[:id])
    params[:entry][:input_at] = Date.strptime(params[:entry][:input_at], '%m/%d/%Y')

    logger.info("UPDATING AN ENTRY")
    session[:current_tab] = 'edit_data'

    respond_to do |format|
      if entry.update_attributes(params[:entry])
        format.json { head :no_content }
        format.html { redirect_to :controller => 'home', :action => 'index' }   
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

 
  def destroy #deletes an entry from the db
    @entry = Entry.find(params[:id])
    @entry.destroy 
    # respond_to do |format|
    #   format.html { redirect_to :back }
    #   format.json { head :no_content }
    # end
  end


end
