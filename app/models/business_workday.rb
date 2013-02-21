class BusinessWorkday < ActiveRecord::Base
  attr_accessible :Fri, :Mon, :Sat, :Sun, :Thu, :Tue, :Wed, :business_id, :period_id

  belongs_to :period
  belongs_to :business
end
