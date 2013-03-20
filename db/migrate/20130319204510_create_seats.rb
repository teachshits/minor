class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :position_id
  	  t.integer :employee_id
  	  t.integer :rank
      t.timestamps
    end
    drop_table :employees_positions
  end
end
