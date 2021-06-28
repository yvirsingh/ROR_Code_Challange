class AddIsResignedToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :is_resigned, :boolean, default: false
  end
end
