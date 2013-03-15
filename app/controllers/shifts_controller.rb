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

    #end
    #@fifi = '[{"id":6,"title":"","description":"","start":"Tue, 05 Mar 2013 22:56:00","end":"Tue, 05 Mar 2013 22:56:00","allDay":false,"recurring":false,"url":"","userID":7}
    #,{"id":7,"title":"ffsfs fsfss","description":"","start":"Tue, 05 Mar 2013 09:59:00","end":"Tue, 05 Mar 2013 17:59:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":10,"title":"","description":"","start":"Sat, 23 Mar 2013 11:00:00","end":"Sat, 23 Mar 2013 14:00:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":11,"title":"","description":"","start":"Tue, 10 Jan 2012 07:00:00","end":"Tue, 10 Jan 2012 10:30:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":12,"title":"","description":"","start":"Tue, 10 Jan 2012 11:00:00","end":"Tue, 10 Jan 2012 22:00:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":13,"title":"","description":"","start":"Wed, 11 Jan 2012 10:30:00","end":"Wed, 11 Jan 2012 14:30:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":15,"title":"","description":"","start":"Sun, 20 Apr 2014 23:05:00","end":"Wed, 30 Apr 2014 23:05:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":4,"title":"","description":"","start":"Thu, 14 Mar 2013 07:00:00","end":"Thu, 14 Mar 2013 09:00:00","allDay":false,"recurring":false,"url":"","userID":null},
    #{"id":2,"title":"fdfd","description":"","start":"Sat, 16 Mar 2013 00:32:00","end":"Sun, 17 Feb 2013 00:32:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":1,"title":"","description":"","start":"Fri, 08 Mar 2013 06:30:00","end":"Fri, 08 Mar 2013 09:30:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":3,"title":"","description":"","start":"Thu, 14 Mar 2013 07:00:00","end":"Thu, 14 Mar 2013 09:30:00","allDay":false,"recurring":false,"url":"","userID":null},
    #{"id":5,"title":"\u0420\u043e\u043c\u0430\u043d \u0422\u0430\u0440\u0430\u0441\u0435\u043d\u043a\u043e","description":"","start":"Sun, 10 Mar 2013 07:00:00","end":"Sun, 10 Mar 2013 09:30:00","allDay":false,"recurring":false,"url":"","userID":7},
    #{"id":8,"title":"","description":"","start":"Thu, 14 Mar 2013 07:00:00","end":"Thu, 14 Mar 2013 10:30:00","allDay":false,"recurring":false,"url":"","userID":null}]'
            #logger.info @fifi
           ## Schedule finding
    @time = Schedule.find(1)
    @range = (@time.period.p_start..@time.period.p_end).to_a
    @many = Schedule.find_all_by_employee_id()

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
