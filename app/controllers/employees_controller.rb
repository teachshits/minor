class EmployeesController < ApplicationController

  before_filter :set_business
  
  def index
    @employees = @business.employees.all
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
    redirect_to employees_url, notice: "Employee successfully created."
  end
  def show
      @employee = Employee.find(params[:id])
      @schedule = Schedule.find_by_employee_id(params[:id])
      @timesheets = @employee.timesheets
      @hours = Employee.find(params[:id]).workhours
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update_attributes(params[:employee])
    @employee.save
    redirect_to employees_url, notice: "Employee successfully updated. #{params[:employee]}"
  end
  
  def destroy
    @employee = @business.employee.find(params[:id])
    @employee.destroy
    redirect_to business_url(session[:biz_id]), notice: "Employee deleted."
  end
  private
    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_employee?(@employee)
    end

    def manager_employee
      redirect_to(root_path) unless current_employee.manager?
    end
end
