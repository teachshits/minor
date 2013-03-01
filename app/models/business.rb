class Business < ActiveRecord::Base
# TODO * Validation on model	
  has_secure_password
  has_many :employees, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :business_workdays, dependent: :destroy
end
