class CreateApprPositions < ActiveRecord::Migration
  def change
    create_table :appr_positions do |t|
      t.integer :position_id
      t.integer :Mon
      t.integer :Tue
      t.integer :Wed
      t.integer :Thu
      t.integer :Fri
      t.integer :Sat
      t.integer :Sun

      t.timestamps
    end
  end
end
