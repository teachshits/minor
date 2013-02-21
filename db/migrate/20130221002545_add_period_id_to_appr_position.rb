class AddPeriodIdToApprPosition < ActiveRecord::Migration
  def change
    add_column :appr_positions, :period_id, :string
  end
end
