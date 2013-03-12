class UsersessionsController < ApplicationController

	def new
	end

	def create
		employee = Employee.find_by_email(params[:usersession][:email].downcase)
		if employee && employee.authenticate(params[:usersession][:password])
			session[:biz_id] = employee.business.id
			log_in employee
			redirect_back_or employee
		else
	 	 flash.now[:error] = 'Invalid username/password combination'
	 	 render 'new'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end
