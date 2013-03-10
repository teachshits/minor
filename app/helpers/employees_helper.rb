#!/bin/env ruby
# encoding: utf-8
module EmployeesHelper
	def rank(type)
		rank = ["Высокий", "Средний", "Низкий"]
		rank[type-1]	
	end
end
