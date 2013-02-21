class BusinessWorkdaysController < ApplicationController
  # GET /business_workdays
  # GET /business_workdays.json
  def index
    @business_workdays = BusinessWorkday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_workdays }
    end
  end

  # GET /business_workdays/1
  # GET /business_workdays/1.json
  def show
    @business_workday = BusinessWorkday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_workday }
    end
  end

  # GET /business_workdays/new
  # GET /business_workdays/new.json
  def new
    @business_workday = BusinessWorkday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_workday }
    end
  end

  # GET /business_workdays/1/edit
  def edit
    @business_workday = BusinessWorkday.find(params[:id])
  end

  # POST /business_workdays
  # POST /business_workdays.json
  def create
    @business_workday = BusinessWorkday.new(params[:business_workday])

    respond_to do |format|
      if @business_workday.save
        format.html { redirect_to @business_workday, notice: 'Business workday was successfully created.' }
        format.json { render json: @business_workday, status: :created, location: @business_workday }
      else
        format.html { render action: "new" }
        format.json { render json: @business_workday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_workdays/1
  # PUT /business_workdays/1.json
  def update
    @business_workday = BusinessWorkday.find(params[:id])

    respond_to do |format|
      if @business_workday.update_attributes(params[:business_workday])
        format.html { redirect_to @business_workday, notice: 'Business workday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_workday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_workdays/1
  # DELETE /business_workdays/1.json
  def destroy
    @business_workday = BusinessWorkday.find(params[:id])
    @business_workday.destroy

    respond_to do |format|
      format.html { redirect_to business_workdays_url }
      format.json { head :no_content }
    end
  end
end
