class AddClockedInToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :clocked_in, :boolean
  end
end
