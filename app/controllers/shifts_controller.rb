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


    @time = Schedule.find(2)
    @range = (@time.period.p_start..@time.period.p_end).to_a
    ###############################  @many = Schedule.find_all_by_employee_id()

    @sooka = '[{"id":6,"title":"","description":"","start":"Sun, 3 Mar 2013 05:30:00 +0000","end":"Tue, 05 Mar 2013 22:56:00","allDay":false,"recurring":false,"url":"","userID":7}]'
    respond_to do |format|
      format.html # index.html.erb @shifts.as_json(:only => [:id, :title, :description,  :start, :end, :allDay, :recurring, :url])
      # schedule_emp_show(@many).flatten
      # schedule_all
      # @time.schedule_show
      format.js  { render :json => @time.schedule_show } 
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
  # PUT /shifts/1.json ############## UNCOMMENT
  def update
    @title = "Home"
    @schedule = Schedule.find(params[:id])
    @start = (params[:shift]["starts_at"]).to_datetime
    @end = (params[:shift]["ends_at"]).to_datetime
    dw = (params[:shift]["starts_at"]).to_datetime.strftime("%a")
    result = @schedule.update_attributes("#{dw}Start".to_sym => @start.to_time, "#{dw}End".to_sym => @end.to_time)
    #@schedule.update_attributes(MonStart: @start.to_time, MonEnd: @end.to_time)
    respond_to do |format|
      #if 
        #@shift.update_attributes(params[:shift])
        #format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        #format.json { redirect_to @shift}
        format.json { render json: "#{result}" }
        

        #format.js { redirect_to @shift}
      #else
      #  format.html { render action: "edit" }
      #  format.json { render json: @shift.errors, status: :unprocessable_entity }
      #  format.js {render :js => @shift.errors, :status=> :unprocessable_entity}
      #end
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
