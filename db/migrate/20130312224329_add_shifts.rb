class AddShifts < ActiveRecord::Migration
  def up
  	create_table :shifts do |t|
  		t.string   :title
  		t.string   :description
        t.datetime :starts_at 
        t.datetime :ends_at
        t.datetime :created_at
        t.datetime :updated_at
        t.integer  :employee_id 
        end
  end

  def down
  end
end
