class SessionsController < ApplicationController

  def new
    unless session[:biz_id].nil?
      redirect_to business_url(session[:biz_id])
    end
  end
  
  def create
    business = Business.find_by_username(params[:username])
    #if business && business.authenticate(params[:password])
      session[:biz_id] = business.id
      redirect_to business_url(business), notice: "You are now logged in"
    #else
    #flash[:alert] = "Incorrect login or Password Try again #{business.authenticate(params[:password])}"
    #render :new

    #end
  end
  
  def destroy
    cookies.delete(:biz_id)
    business = nil
    @current_employee = nil
    redirect_to root_url
  end

end
