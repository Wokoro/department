class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers do |t|
      t.string :staff_id
      t.string :password_digest

      t.timestamps
    end
  end
end
