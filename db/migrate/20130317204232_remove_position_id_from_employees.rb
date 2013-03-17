class RemovePositionIdFromEmployees < ActiveRecord::Migration
  def up
	remove_column :employees, :position_id
  end

  def down
  end
end
