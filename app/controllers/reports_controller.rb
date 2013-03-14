class ReportsController < ApplicationController
  def index
  	@timesheets = Timesheet.all 
  end

  def show
	@timesheet = Timesheet.find_all_by_employee_id(params[:id])
  end
end
