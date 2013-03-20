class ShiftsController < ApplicationController
 
  skip_before_filter :verify_authenticity_token


  def format_date(date_time)
    Date.parse(Time.at(date_time.to_i).to_s)
  end

  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.scoped
    @initDate = Date.new(2013, 03, 13)

    logger.info @initDate

    logger.info "# shifts " + @shifts.size.to_s()

    # @shifts = @shifts.after(params['start']) if (params['start'])
    # @shifts = @shifts.before(params['end']) if (params['end'])

    @dd = format_date(params['start']) - @initDate

    logger.info format_date(params['start'])

    logger.info @dd.to_i

    if (@dd>=7)
    
      @shifts.each do |shift|
        shift.starts_at += @dd.to_i.days
        shift.ends_at += @dd.to_i.days
        logger.info shift.starts_at
        logger.info shift.ends_at
      end
    
    end
      respond_to do |format|
      format.html # index.html.erb @shifts.as_json(:only => [:id, :title, :description,  :start, :end, :allDay, :recurring, :url])
      format.js  { render :json => @shifts.as_json(:only => [:id, :title, :description,  :start, :end, :allDay, :recurring, :url]) } 
    end
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def by_id
       @shifts = Shift.find_all_by_employee_id(params[:emp_id])
    render :action => :index
  end
  def show
    @shift = Shift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js { render :json => @shift.as_json }
    end
  end

  # GET /shifts/new
  # GET /shifts/new.json
  def new
    @shift = Shift.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shift }
    end
  end

  # GET /shifts/1/edit
  def edit
    @shift = Shift.find(params[:id])
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(params[:shift])

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render json: @shift, status: :created, location: @shift }
      else
        format.html { render action: "new" }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shifts/1
  # PUT /shifts/1.json
  def update
    @title = "Home"
    @shift = Shift.find(params[:id])

    respond_to do |format|
      if @shift.update_attributes(params[:shift])
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { redirect_to @shift}
        #format.js { redirect_to @shift}
      else
        format.html { render action: "edit" }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
        format.js {render :js => @shift.errors, :status=> :unprocessable_entity}
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url }
      format.json { head :ok }
    end
  end
end