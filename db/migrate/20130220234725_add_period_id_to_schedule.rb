class AddPeriodIdToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :period_id, :string
  end
end
