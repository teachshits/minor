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
