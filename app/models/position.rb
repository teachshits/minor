class Position < ActiveRecord::Base
# TODO * Validation on model	
  attr_accessible :employee_id, :pos, :pos_id, :business_id
  belongs_to :business

  has_many :employees, dependent: :destroy
  has_many :appr_positions
  
end
