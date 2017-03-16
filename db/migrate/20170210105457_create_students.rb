class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :matno
      t.string :password

      t.timestamps
    end
  end
end
