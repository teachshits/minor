class CreateBusinessWorkdays < ActiveRecord::Migration
  def change
    create_table :business_workdays do |t|
      t.integer :business_id
      t.integer :period_id
      t.time :MonStart
      t.time :MonEnd
      t.time :TueStart
      t.time :TueEnd
      t.time :WedStart
      t.time :WedEnd
      t.time :ThuStart
      t.time :ThuEnd
      t.time :FriStart
      t.time :FriEnd
      t.time :SatStart
      t.time :SatEnd
      t.time :SunStart
      t.time :SunEnd

      t.timestamps
    end
  end
end
