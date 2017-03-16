class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :matno
      t.string :name
      t.string :course_title
      t.integer :grade
      t.integer :point

      t.timestamps
    end
  end
end
