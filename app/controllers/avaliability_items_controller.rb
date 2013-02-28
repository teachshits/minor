class AvaliabilityItemsController < ApplicationController
  # GET /avaliabilities/avaliability_items
  # GET /avaliabilities/avaliability_items.json
  
  def index
    @avaliability_items = AvaliabilityItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avaliability_items }
    end
  end

  # GET /avaliabilities/avaliability_items/1
  # GET /avaliabilities/avaliability_items/1.json
  def show
    @avaliability_item = AvaliabilityItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avaliability_item }
    end
  end

  # GET /avaliabilities/avaliability_items/new
  # GET /avaliabilities/avaliability_items/new.json
  def new
    @avaliability_item = AvaliabilityItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avaliability_item }
    end
  end

  # GET /avaliabilities/avaliability_items/1/edit
  def edit
    @avaliability_item = AvaliabilityItem.find(params[:id])
  end

  # POST /avaliabilities/avaliability_items
  # POST /avaliabilities/avaliability_items.json
  def create
    @avaliability_item = AvaliabilityItem.new(params[:avaliability_item])

    respond_to do |format|
      if @avaliability_item.save
        format.html { redirect_to @avaliability_item, notice: 'Avaliability item was successfully created.' }
        format.json { render json: @avaliability_item, status: :created, location: @avaliability_item }
      else
        format.html { render action: "new" }
        format.json { render json: @avaliability_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /avaliabilities/avaliability_items/1
  # PUT /avaliabilities/avaliability_items/1.json
  def update
    @avaliability_item = AvaliabilityItem.find(params[:id])

    respond_to do |format|
      if @avaliability_item.update_attributes(params[:avaliability_item])
        format.html { redirect_to @avaliability_item, notice: 'Avaliability item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @avaliability_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliabilities/avaliability_items/1
  # DELETE /avaliabilities/avaliability_items/1.json
  def destroy
    @avaliability_item = AvaliabilityItem.find(params[:id])
    @avaliability_item.destroy

    respond_to do |format|
      format.html { redirect_to avaliability_items_url }
      format.json { head :no_content }
    end
  end
end
