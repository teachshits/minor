class Position < ActiveRecord::Base
# TODO * Validation on model	
  attr_accessible :employee_id, :pos, :pos_id, :business_id
  belongs_to :business

  has_and_belongs_to_many :employees
  has_many :appr_positions
  
end
