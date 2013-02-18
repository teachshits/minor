class AddWorkdayToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :workday, :integer
  end
end
