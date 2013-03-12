class AddTimesheets < ActiveRecord::Migration
  def up
	create_table :timesheets do |t|
        t.datetime :punch_in 
        t.datetime :punch_out 
        t.integer  :employee_id 
        t.string   :change_log
        end
  end

  def down
  end
end
