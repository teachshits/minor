module EmployeesHelper
	def rank(type)
		rank = ["High", "Medium", "Low"]
		rank[type-1]	
	end
end
