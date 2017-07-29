class CreateStudentOthernames < ActiveRecord::Migration[5.0]
  def change
    create_table :student_othernames do |t|
    	t.references :student
    	t.string :othernames
    end
  end
end
