class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :pos
      t.integer :pos_id
      t.integer :business_id

      t.timestamps
    end
  end
end
