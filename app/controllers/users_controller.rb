class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index #shows list of all registered users
    @users = User.all
    @user = User.new
    @trials = Trial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def activate #called when a user clicks a confirmation link in their email. An activated account can then be used
      @user=User.find(params[:id])
      session[:username] = @user.username
      session[:userID] = @user.id
      session[:current_trial] = nil
      if @user.activate?
        redirect_to :controller => 'home', :action => 'index'
      else
        redirect_to "localhost:3000"
      end
  end 

  # GET /users/1
  # GET /users/1.json
  def show
    @trials = Trial.all
    @user = User.find(params[:id])
    # if session[:userID] != @user.id
    #    format.html { redirect_to :controller => 'home', :action => 'index' }
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.activated = false
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@user).deliver
        @user.update_attributes(:activated => false)
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    pw = @user.password
    logger.info("password")
    logger.info(pw)
    @user.password = Digest::SHA2.hexdigest(pw)
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
