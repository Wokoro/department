class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers, id:false do |t|
    	t.string :lecturer_id, primary_key:true, index:true, unique:true
    	t.string :sname
    	t.string :fname
    	t.string :password_digest
    end
  end
end
