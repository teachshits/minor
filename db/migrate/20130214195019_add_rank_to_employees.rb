class AddRankToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :rank, :integer
  end
end
