class AssignmentSubmissions < ActiveRecord::Migration[5.0]
  def change
  	 create_table :assignment_submissions do |t|
    	t.references :student, index: true, foreign_key: true
    	t.references :assignment, index: true, foreign_key: true
    	t.string :file, null: false
      t.timestamps
    end
  end
end
