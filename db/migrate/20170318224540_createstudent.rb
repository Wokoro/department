class Createstudent < ActiveRecord::Migration[5.0]
  def change
  	create_table :students, id:false do |t|
  		t.string :matno, primary_key:true, index:true, unique:true
  		t.string :sname
  		t.string :fname
  		t.string :lga
  		t.integer :level
  		t.string :password_digest
  	end
  end
end