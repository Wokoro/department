class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
    	t.references :lecturer, index: true, null: false, foreign_key: true
    	t.references :course, index: true, null: false, foreign_key: true
    	t.string :session, index: true, null: false, foreign_key: true
    	t.datetime :submission_date
    	t.string :assignment_path
    	t.string :file
    end
  end
end
