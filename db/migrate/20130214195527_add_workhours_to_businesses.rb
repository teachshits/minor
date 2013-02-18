class AddWorkhoursToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :workhours, :integer
  end
end
