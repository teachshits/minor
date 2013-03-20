class SchedulesController < ApplicationController

  before_filter :set_business
  def index
    @schedule = Shift.all
  end

  def calculate 
    #
    # FRIDAY DEADLINE
    #
  end

end
