class Createstudent < ActiveRecord::Migration[5.0]
  def change
  	create_table :students  do |t|
  		t.string :matno, index: true, unique: true, null: false
  		t.string :sname, index: true, null: false
  		t.string :fname, index: true, null: false
      t.string :state_of_origin, null: false
      t.string :lga, null: false
      t.string :nationality, null: false
      t.string :religion
      t.string :phone
      t.string :email
      t.binary :passport
      t.integer :sex, null: false
      t.integer :level, null: false, default: 100
      t.string :password_digest
  	end
  end
end