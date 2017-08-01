class AddPasswordToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :password, :string
    add_index :lecturers, :password
  end
end
