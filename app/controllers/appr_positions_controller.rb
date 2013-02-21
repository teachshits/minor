class ApprPositionsController < ApplicationController
  # GET /appr_positions
  # GET /appr_positions.json
  def index
    @appr_positions = ApprPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appr_positions }
    end
  end

  # GET /appr_positions/1
  # GET /appr_positions/1.json
  def show
    @appr_position = ApprPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appr_position }
    end
  end

  # GET /appr_positions/new
  # GET /appr_positions/new.json
  def new
    @appr_position = ApprPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appr_position }
    end
  end

  # GET /appr_positions/1/edit
  def edit
    @appr_position = ApprPosition.find(params[:id])
  end

  # POST /appr_positions
  # POST /appr_positions.json
  def create
    @appr_position = ApprPosition.new(params[:appr_position])

    respond_to do |format|
      if @appr_position.save
        format.html { redirect_to @appr_position, notice: 'Appr position was successfully created.' }
        format.json { render json: @appr_position, status: :created, location: @appr_position }
      else
        format.html { render action: "new" }
        format.json { render json: @appr_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appr_positions/1
  # PUT /appr_positions/1.json
  def update
    @appr_position = ApprPosition.find(params[:id])

    respond_to do |format|
      if @appr_position.update_attributes(params[:appr_position])
        format.html { redirect_to @appr_position, notice: 'Appr position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appr_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appr_positions/1
  # DELETE /appr_positions/1.json
  def destroy
    @appr_position = ApprPosition.find(params[:id])
    @appr_position.destroy

    respond_to do |format|
      format.html { redirect_to appr_positions_url }
      format.json { head :no_content }
    end
  end
end
