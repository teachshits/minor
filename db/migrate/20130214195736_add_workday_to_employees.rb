class AddWorkdayToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :workhours, :integer
  end
end
