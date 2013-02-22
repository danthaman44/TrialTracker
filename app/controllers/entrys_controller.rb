class EntryController < ApplicationController
	def index
    
    end
  end
	def new
		@entry = Entry.new
	end
	def create
		@entry = entry.new(params[:article])
	  if @entry.save
        #format.html { redirect_to @article, :notice => 'Article was successfully created.' }
        #format.json { render :json => @article, :status => :created, :location => @article }
      else
        #format.html { render :action => "new" }
        #format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
  end
end
