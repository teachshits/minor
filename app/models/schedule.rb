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

end
start = -> { datetime_from_date_time(@period.p_start,Time.at(@workhour.send("#{@dw}Start"))) }
over = -> { datetime_from_date_time(@period.p_start,Time.at(@workhour.send("#{@dw}End"))) }
# calculus(@emp_r1).in_groups_of(3)
def calculus(emps1) 
  @bad2 = [] 
  @bad3 = []
  @array = []
  @start = datetime_from_date_time(@period.p_start,Time.at(@workhour.send("#{@dw}Start"))) # Mon, 18 Mar 2013 08:15:00 +0000
  @over = datetime_from_date_time(@period.p_start,Time.at(@workhour.send("#{@dw}End"))) # Mon, 18 Mar 2013 23:00:00 +0000
      emps1.each do |emp|
          bad2 if @quantity == 2 && (@array.in_groups_of(3).length > @quantity && @array.in_groups_of(3).length < @quantity*2 )
          bad3 if @quantity >=3 && !(@bad3.nil?)
          @last = step(emp.workhours.hour, @start, @over)
          enter(emp.name, @start, @last, @quantity)
      end
    @array
end

def step(wh, start, over)
  last = start + wh
    if (!last.nil?) && (last > over)
      last = over
    end # avoid overload of last point and end time company
  last    
end
def enter(name, start, lst, quantity)
  unless start == lst # Put to array only if start point not equal last
        @bad2 << @array.last if !(@array.last.nil?) && lst != @array.last && lst != @over && @bad2.last != lst && @quantity == 2
        @bad3 << @array.last if !(@array.last.nil?) && @array.last != @over && @quantity >=3
        @array << name
        @array << start
        @array << lst
        if @array.in_groups_of(3).length == @quantity || @array.in_groups_of(3).length == @quantity*2
          @start = @array.last if start <= @over
        end
  end
end
def bad2 # If workhour various check diffirency and owerwrite start for 2 emps
  unless @bad2.nil?
    @bad2 << @start
    @start = @bad2.first
    @bad2.shift
  end
end
def bad3 # If workhour various check diffirency and owerwrite start for >3 emps
    unless @bad3.nil?
    if @array.in_groups_of(3).length > @quantity && @array.in_groups_of(3).length < @quantity*2
      @start = @bad3.first
      @bad3.shift
    end
    end 
end