class Position < ActiveRecord::Base
  attr_accessible :employee_id, :pos, :pos_id
  belongs_to :business

  has_many :employees, dependent: :destroy
  
end
