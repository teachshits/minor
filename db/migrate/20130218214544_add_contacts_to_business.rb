class AddContactsToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :phone, :integer
    add_column :businesses, :adress, :string
    add_column :businesses, :subscription_id, :integer
  end
end
