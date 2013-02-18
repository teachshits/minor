class EmployeesController < ApplicationController

  before_filter :set_business
  
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = @business.employees.find(params[:id])
  end

  def create
    @employee = @business.employees.new(params[:employee])
    @employee.payrate = (@employee.payrate/100)
    @employee.save
    redirect_to business_url(session[:biz_id]), notice: "Employee successfully created."
  end
  def show
      @employee = Employee.find([params[:id]])
      @schedule = Schedule.find_all_by_employee_id([params[:id]])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update_attributes(params[:employee])
    @employee.save
    redirect_to business_url(session[:biz_id]), notice: "Employee successfully updated."
  end
  
  def destroy
    @employee = @business.employee.find(params[:id])
    @employee.destroy
    redirect_to business_url(session[:biz_id]), notice: "Employee deleted."
  end
  
end
