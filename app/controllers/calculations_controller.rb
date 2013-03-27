class CalculationsController < ApplicationController
# TODO: add named_scopes
# OPTIMIZE: improve the code 
# TODO: Fill data in DB
# TODO: Not select before? 
# TODO: Grenn exapnder, workday expander | Smart selecting Smart selection | Often selection
def index
	# Calculation variables	
	#  params = {dw: "Mon", pos: 14}
	@workhour = BusinessWorkday.first
	@dw = (params[:dw])
	@wd = @workhour.send("#{@dw}End") - @workhour.send("#{@dw}Start") ## CLEAR THAT SHIT
	@period = Period.last
	@period_d = @period.p_start..@period.p_end
	@positions = Position.find(params[:position])
	@emp = Position.find(params[:position]).employees
	@quantity = ApprPosition.find_by_position_id(params[:position]).Mon
	@emp_r1 = Position.find(params[:position]).employees.where(rank: 1)
	@emp_r2 = Position.find(params[:position]).employees.where(rank: 2)
	@emp_r3 = Position.find(params[:position]).employees.where(rank: 3)
    @selected = []
end
private 

#r = (time1.to_i..time2.to_i) it timespaps
# ((8..12).to_a & (10..20).to_a).present?
# (8..12).overlaps?(10..20)
# (1..5).include?(1..5) # => true
# (1..5).include?(2..3) # => true
# (1..5).include?(2..6) # => false


# red(4, 10, 20) ##old method
# def red(id, s, e)
# av = Employee.find_by_id(id).avaliabilities.last.avaliability_items.where(type_d: 1)
# av.each do |avl|
# range = avl.start_time.hour..avl.end_time.hour
# puts range
# end
# av.each do |av|
# @range_array = []
# @range_array << (av.start_time.hour..av.end_time.hour)
# end
# @range_array.each do |redrange| 
# t = redrange
# t.each do |ts| # [8, 9, 10, 11, 12, 13]
# if ts.between?(s, e) 
# @result = 0+1
# end

# end
# puts @result
# # for often selection
# puts t.last

# puts @b
# puts av
# end

# end

# def green(id, s, e)
# Find AV for id by type (green)
# av= get(av.s..av.e)
# s..e === av # true of false
# end
#end

	def red(id, s, e)
	unless Employee.find_by_id(id).avaliabilities.last.to_s.empty?
	av = Employee.find_by_id(id).avaliabilities.last.avaliability_items.where(type_d: 1)

	av.each do |av|
	@range_array = []
	@range_array << (av.start_time.hour..av.end_time.hour)
	# @range_array = @range_array.in_groups_of(2)
	end

	@range_array.each do |redrange|
	t = redrange
	t.each do |ts| # [8, 9, 10, 11, 12, 13]
	if (@range_array.first).include?(s..e)
	return true
	#=> [8..13]
	# red(4, 8, 14) # true
	end
	end
	end
	end


	def green(id, s, e)
	unless Employee.find_by_id(id).avaliabilities.last.to_s.empty?
	av = Employee.find_by_id(id).avaliabilities.last.avaliability_items.where(type_d: 2)
	end
	av.each do |av|
	@range_array = []
	@range_array << (av.start_time.hour..av.end_time.hour)
	# @range_array = @range_array.in_groups_of(2)
	end

	@range_array.each do |redrange|
	t = redrange
	t.each do |ts| # [8, 9, 10, 11, 12, 13]
	if (@range_array.first).include?(s..e)
	return true
	#=> [8..13]
	# red(4, 8, 14) # true
	end
	end
	end
	end	
end

end

