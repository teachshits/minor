class BusinessWorkday < ActiveRecord::Base
# TODO * Validation on model	
# TODO Send changer
  attr_accessible :Fri, :Mon, :Sat, :Sun, :Thu, :Tue, :Wed, :business_id, :period_id

  belongs_to :period
  belongs_to :business
end

def datetime_from_date_time(d, t)
		DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
end
## SEND CHANGER
# class BusinessWorkday #добавляем в этотм класс метод в котором преобразование происходят
# def wday_start
# @DW = %w{Mon Tue Wed Thu Fri Sat Sun}
# self.send("#{@DW.first}Start") #сюда можно и цикл впихнуть
# end
# end