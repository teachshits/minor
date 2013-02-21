class CreateBusinessWorkdays < ActiveRecord::Migration
  def change
    create_table :business_workdays do |t|
      t.integer :business_id
      t.integer :period_id
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
