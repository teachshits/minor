class SchedulesController < ApplicationController

  before_filter :set_business
  def index
    @schedule = Schedule.all
  end
  def new
    @schedule = Schedule.new  
    @employee = Employee.find(params[:employee_id])
    payrate = params[:rate_this_week]
    @schedule.employee = @employee
    @schedule.rate_this_week = payrate
  end

  def create
    @schedule = Schedule.new(params[:schedule])
    @schedule.save
    redirect_to business_url(@business), notice: "Schedule Updated"
  end

  def show 
    #@schedule = Schedule.new  
    @schedule = Schedule.find(params[:id])
    @employee_id = @schedule.employee_id
    @employee = Employee.find(@employee_id)
    #payrate = params[:rate_this_week]
    #@schedule.employee = @employee
  end
 def update
    @schedule = Schedule.find(params[:id])
    @schedule.update_attributes(params[:schedule])
    @schedule.save
    redirect_to @schedule, :notice => "You just edited your schedule."
  end

  def calculate 
    #
    # FRIDAY DEADLINE
    #
  end

end
