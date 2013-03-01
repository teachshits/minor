class Schedule < ActiveRecord::Base
# TODO * Validation on model	    
# validates :warranty_start, :presence => true, :if => :warranty_want?
# validates :warranty_end, :presence => true, :if => :warranty_want?

# def warranty_want?
#     accept == 1
# end
 
  belongs_to :employee
  belongs_to :period
end
