class Avaliability < ActiveRecord::Base
# TODO * Validation on model	
  attr_accessible :description, :employee_id, :end_date, :name, :ongoing, :repeat, :start_date

  has_many :avaliability_items, dependent: :destroy
  belongs_to :employee
end
