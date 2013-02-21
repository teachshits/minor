class ApprPosition < ActiveRecord::Base
  attr_accessible :Fri, :Mon, :Sat, :Sun, :Thu, :Tue, :Wed, :position_id
  belongs_to :position
end
