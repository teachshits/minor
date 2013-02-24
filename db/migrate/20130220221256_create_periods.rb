class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :p_start
      t.date :p_end

      t.timestamps
    end
  end
end
