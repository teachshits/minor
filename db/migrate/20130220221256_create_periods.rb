class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.datetime :p_start
      t.datetime :p_end

      t.timestamps
    end
  end
end
