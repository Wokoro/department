class CreateCourseAllocations < ActiveRecord::Migration[5.0]
  def change
    create_table :course_allocations do |t|
    	t.references :lecturer
    	t.references :course
      t.timestamps
    end
  end
end
