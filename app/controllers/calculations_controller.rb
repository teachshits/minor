class CalculationsController < ApplicationController

def index
	# Calculation variables	
	@period = Period.last
	@positions = Position.find(14)
	@emp = Employee.find_all_by_position_id(14)
	@quantity = ApprPosition.find_by_position_id(14).Mon
	# Rails 4
	# @emp_r1 = Employee.where(position_id: 14).where(rank: 1)
	@emp_r1 = Employee.find_all_by_position_id_and_rank(14, 1)
	@emp_r2 = Employee.find_all_by_position_id_and_rank(14, 2)
	@emp_r3 = Employee.find_all_by_position_id_and_rank(14, 3)
end

end