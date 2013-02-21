class AvaliabilitiesController < ApplicationController
  # GET /avaliabilities
  # GET /avaliabilities.json
  def index
    @avaliabilities = Avaliability.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avaliabilities }
    end
  end

  # GET /avaliabilities/1
  # GET /avaliabilities/1.json
  def show
    @avaliability = Avaliability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avaliability }
    end
  end

  # GET /avaliabilities/new
  # GET /avaliabilities/new.json
  def new
    @avaliability = Avaliability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avaliability }
    end
  end

  # GET /avaliabilities/1/edit
  def edit
    @avaliability = Avaliability.find(params[:id])
  end

  # POST /avaliabilities
  # POST /avaliabilities.json
  def create
    @avaliability = Avaliability.new(params[:avaliability])

    respond_to do |format|
      if @avaliability.save
        format.html { redirect_to @avaliability, notice: 'Avaliability was successfully created.' }
        format.json { render json: @avaliability, status: :created, location: @avaliability }
      else
        format.html { render action: "new" }
        format.json { render json: @avaliability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /avaliabilities/1
  # PUT /avaliabilities/1.json
  def update
    @avaliability = Avaliability.find(params[:id])

    respond_to do |format|
      if @avaliability.update_attributes(params[:avaliability])
        format.html { redirect_to @avaliability, notice: 'Avaliability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @avaliability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliabilities/1
  # DELETE /avaliabilities/1.json
  def destroy
    @avaliability = Avaliability.find(params[:id])
    @avaliability.destroy

    respond_to do |format|
      format.html { redirect_to avaliabilities_url }
      format.json { head :no_content }
    end
  end
end
