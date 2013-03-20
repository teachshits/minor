class Position < ActiveRecord::Base
# TODO * Validation on model	
  attr_accessible :employee_id, :pos, :pos_id, :business_id, :position_ids
  belongs_to :business

  has_many :seats
  has_many :employees, through: :seats
  has_many :appr_positions
  
end
