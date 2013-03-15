class CreateEmployeesPositions < ActiveRecord::Migration
  def change
  	create_table :employees_positions, id: false do |t|
  		t.integer :position_id
  		t.integer :employee_id
  	end
  end

end
