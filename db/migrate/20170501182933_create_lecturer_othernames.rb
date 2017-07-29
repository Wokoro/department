class CreateLecturerOthernames < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturer_othernames do |t|
    	t.references :lecturer
    	t.string :othernames
    end
  end
end
