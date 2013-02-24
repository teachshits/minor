class CalculationsController < ApplicationController

def index
	# Calculation variables	
	@period = Period.last
	@positions = Position.find(14)
	@emp = Employee.find_all_by_position_id(14)
	@quantity = ApprPosition.find_by_position_id(14).Mon
end

end