class Seat < ActiveRecord::Base
  attr_accessible :employee_id, :position_id, :rank
  belongs_to :employee
  belongs_to :position
end
