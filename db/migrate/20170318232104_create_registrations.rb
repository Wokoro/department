class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
    	t.references :student, index:true, foreign_key: true
    	t.references :course,  index:true, foreign_key: true
    	t.string :session, null: false
        t.integer :units
    	t.integer :C_A_score, default: 0
    	t.integer :exam_score, default: 0
    	t.integer :year_of_study, index: true, null: false
    	t.string :session, null: false, index: true
    	t.integer :status, null: false
    end
  end
end
