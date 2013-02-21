class CreateAvaliabilityItems < ActiveRecord::Migration
  def change
    create_table :avaliability_items do |t|
      t.integer :avaliability_id
      t.integer :day
      t.integer :type
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
