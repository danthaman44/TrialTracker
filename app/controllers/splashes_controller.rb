class SplashesController < ApplicationController
  # GET /splashes
  # GET /splashes.json
  def index
    @splashes = Splash.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @splashes }
    end
  end

  # GET /splashes/1
  # GET /splashes/1.json
  def show
    @splash = Splash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @splash }
    end
  end

  # GET /splashes/new
  # GET /splashes/new.json
  def new
    @splash = Splash.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @splash }
    end
  end

  # GET /splashes/1/edit
  def edit
    @splash = Splash.find(params[:id])
  end

  # POST /splashes
  # POST /splashes.json
  def create
    @splash = Splash.new(params[:splash])

    respond_to do |format|
      if @splash.save
        format.html { redirect_to @splash, notice: 'Splash was successfully created.' }
        format.json { render json: @splash, status: :created, location: @splash }
      else
        format.html { render action: "new" }
        format.json { render json: @splash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /splashes/1
  # PUT /splashes/1.json
  def update
    @splash = Splash.find(params[:id])

    respond_to do |format|
      if @splash.update_attributes(params[:splash])
        format.html { redirect_to @splash, notice: 'Splash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @splash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /splashes/1
  # DELETE /splashes/1.json
  def destroy
    @splash = Splash.find(params[:id])
    @splash.destroy

    respond_to do |format|
      format.html { redirect_to splashes_url }
      format.json { head :no_content }
    end
  end
end
