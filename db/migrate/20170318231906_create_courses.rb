class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses, id:false do |t|
    	t.string :ccode, index:true, primary_key:true, unique:true
    	t.string :ctitle
    	t.integer :units
    	t.integer :level
    	t.references :lecturers, primary_key: :lecturer_id
    	t.string :semester
    	t.integer :level
    end
  end
end
