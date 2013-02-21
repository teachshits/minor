class AddWorkhoursToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :work_sch_id, :integer
  end
end
