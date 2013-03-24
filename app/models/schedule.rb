class Schedule < ActiveRecord::Base
# TODO * Validation on model	    
# validates :warranty_start, :presence => true, :if => :warranty_want?
# validates :warranty_end, :presence => true, :if => :warranty_want?

# def warranty_want?
#     accept == 1 Schedule.find(1).schedule_id
# end
 

# -------------------------------------------------------
# Relationships / Associations
# -------------------------------------------------------
belongs_to :employee
belongs_to :period

# -------------------------------------------------------
# Validations
# -------------------------------------------------------

# -------------------------------------------------------
# Class Methods
# -------------------------------------------------------

# -------------------------------------------------------
# Instance Methods
# -------------------------------------------------------
public
def calc_stime(time)
  @h = {}
  @range.zip(time) { |a,b| @h[a] = b }
  @h = @h.reject { |k,v| v.blank?  }
  array = []
  @h.each do |k,v|
  array << datetime_from_date_time(k,v).rfc822
  end
  return array
end

def datetime_from_date_time(d, t)
DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
end
# rank1(@emp_r1).in_groups_of(3)
def rank1(quantity=2, emp_r1) 
	selected = []
	array = []
	workhour = []
	@savings = []
	@start = datetime_from_date_time(@period.p_start,Time.at(@workhour.send("#{@dw}Start")))
	@endd = datetime_from_date_time(@period.p_start,Time.at(@workhour.send("#{@dw}End")))
	emp_r1.each do |emp|
		userhour = emp.workhours
		selected << emp
	end
	#if !(@savings.nil?) then @start = @savings.first; @savings.shift;  end
	selected.each do |selected|
		if workhour.nil? then workhour = selected.workhours.hour end
		if workhour != selected.workhours.hour then @savings << @last; workhour = selected.workhours.hour; end # save normal time for employer
		@last = @start + selected.workhours.hour

		!@last.nil? && @last > @endd ? @last = @endd : @last # avoid overload of end time company
			unless @start == @last # Put to array only if start point not equal last
			array << selected.name
			array << @start
			array << @last

				if array.in_groups_of(3).length == quantity || array.in_groups_of(3).length == quantity*2
				#old selectors @start = @last if @last <= @endd
					if !(@savings.nil?) then @start = @savings.first; @savings.shift; else # Dont asign start p if saving exist
					@start = array.last if @start <= @endd
					end
				end
			end
			p @last
	end
	p array
end
def rank2(quantity=2, emp_r2) 
	selected = []
	array = []
	workhour = []
	emp_r2.each do |emp|
		userhour = emp.workhours
		selected << emp
	end
	selected.each do |selected|
		if workhour.nil? then workhour = selected.workhours.hour end
		if workhour != selected.workhours.hour then @savings << @last; workhour = selected.workhours.hour; end # save normal time for employer
		@last = @start + selected.workhours.hour

		!@last.nil? && @last > @endd ? @last = @endd : @last # avoid overload of end time company
			unless @start == @last # Put to array only if start point not equal last
			array << selected.name
			array << @start
			array << @last
				if array.in_groups_of(3).length == quantity || array.in_groups_of(3).length == quantity*2
				#old selectors @start = @last if @last <= @endd
					#!#  if !(@savings.nil?) then @start = @savings.first; @savings.shift; else # Dont asign start p if saving exist
					@start = array.last if @start <= @endd
					end
				end
			end
	end
	array
end
def rank3(quantity=2, emp_r3) 
	selected = []
	array = []
	workhour = []
	emp_r3.each do |emp|
		userhour = emp.workhours
		selected << emp
	end
	if !(@savings.nil?) then @start = @savings.first; @savings.shift;  end
	selected.each do |selected|
		if workhour.nil? then workhour = selected.workhours.hour end
		if workhour != selected.workhours.hour then @savings << @last; workhour = selected.workhours.hour; end # save normal time for employer
		@last = @start + selected.workhours.hour

		!@last.nil? && @last > @endd ? @last = @endd : @last # avoid overload of end time company
			unless @start == @last # Put to array only if start point not equal last
			array << selected.name
			array << @start
			array << @last
				if array.in_groups_of(3).length == quantity || array.in_groups_of(3).length == quantity*2
				#old selectors @start = @last if @last <= @endd
					if !(@savings.nil?) then @start = @savings.first; @savings.shift; else # Dont asign start p if saving exist
					@start = array.last if @start <= @endd
					end
				end
			end
	end
	array
end



# @time.schedule_show

# def schedule_show(schedule = self, period = self.period, sch_id = self.id)
# 	  @range = (period.p_start..period.p_end).to_a
# 	  dw = %w{Mon Tue Wed Thu Fri Sat Sun}
# 	  start_time = []
# 	  end_time = []
# 	  dw.each do |dayweek|
# 	    start_time << schedule.send("#{dayweek}Start")
# 	    end_time << schedule.send("#{dayweek}End")   
# 	  end
# 	  start = calc_stime(start_time) #DATE ARRAY
# 	  endd = calc_stime(end_time)   #DATE ARRAY
# 	  result = start.zip(endd) # [[dw_start, dw_end], [..]]
# 	  result = result.map{|item| item << sch_id; item << schedule.employee.name }
# 	  final = []
# 	  result.each do |res|
# 	  final << Hash[*("start,end,id,name".split(',').zip(res).flatten)]
# 	  end
# 	  a = []
# 	  final.each do |final|
# 	      lol = []
# 	      lol << final["id"]
# 	      lol << final["start"]
# 	      lol << final["end"]
# 	      a << lol
# 	  end
# 	  fififi = []
# 	  a.each do |res|
# 	     fififi << Hash[*("id,start,end,title,description,allDay,recurring,url,userID".split(',').zip(res).flatten)]
# 	  end
# 	  lol = []
# 	  fififi.each do |elem|
# 	    elem["title"] = "#{schedule.employee.name}"
# 	    elem["description"] = "#{schedule.employee.name}"
# 	    elem["allDay"] = false
# 	    elem["recurring"] = false
# 	    elem["url"] = ""
# 	    elem["userID"] = schedule.employee.id
# 	    lol << elem
# 	  end
# 	  #lol
# end      

    
end
