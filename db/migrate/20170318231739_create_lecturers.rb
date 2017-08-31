class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers do |t|
    	t.string :staff_id, index: true, unique: true, null: false
  		t.string :sname, index: true, null: false
  		t.string :fname, index: true, null: false
      t.integer :sex, null: false
      t.string :state_of_origin, null: false
  		t.string :lga, null: false
      t.string :nationality, null: false
      t.string :religion
      t.string :phone
      t.string :email
      t.string :password_digest
      t.binary :passport
    end
  end
end
