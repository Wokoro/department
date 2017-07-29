class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
    	t.string :ccode, index: true, unique: true, null: false
    	t.string :ctitle, unique: true, null: false
    	t.integer :units
    	t.integer :level
    	t.integer :semester, null: false
    	t.integer :level, null: false
    end
  end
end
