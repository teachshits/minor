class Business < ActiveRecord::Base
  has_secure_password
  has_many :employees, dependent: :destroy
  has_many :positions, dependent: :destroy
end
