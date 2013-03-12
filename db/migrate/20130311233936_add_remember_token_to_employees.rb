class AddRememberTokenToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :remember_token, :string
  end
end
