class CreateAssignmentSubmissions < ActiveRecord::Migration[5.0]
  def change
  	 create_table :assignment_submissions do |t|
    	t.references :student, index: true, foreign_key: true
    	t.references :assignment, index: true, foreign_key: true
    end
  end
end
