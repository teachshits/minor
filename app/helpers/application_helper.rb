#coding: utf-8
module ApplicationHelper
	def controller?(*controller)
    	controller.include?(params[:controller])
  	end
  	def employee_nav 
  		if (controller?("employees") || controller?("positions") || controller?("appr_positions") || controller?("reports") )
  			then 
  		return " active" 
  		end
  	end	
  	def clocked_in(var)
  		if var then "На работе" 
  		else
  			"Вне работы"
  		end
  	end
end
