class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :parent_id
      t.integer :salary
      t.integer :rating
      t.integer :role
      t.integer :emp_id

      t.timestamps
    end
  end
end
