class CreateAvaliabilities < ActiveRecord::Migration
  def change
    create_table :avaliabilities do |t|
      t.integer :employee_id
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.boolean :ongoing
      t.integer :repeat

      t.timestamps
    end
  end
end
