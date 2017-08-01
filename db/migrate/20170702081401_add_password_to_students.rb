class AddPasswordToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :password, :string
    add_column :students, :level, :integer, null: false, default: 100
    add_index :students, :password
  end
end
