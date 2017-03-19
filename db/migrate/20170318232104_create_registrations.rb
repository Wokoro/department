class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
    	t.string :session
    	t.integer :score

    	t.references :students, index:true
    	t.references :courses,  index:true
      t.timestamps
    end
  end
end
