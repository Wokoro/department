class CreateUtils < ActiveRecord::Migration[5.0]
  def change
    create_table :utils do |t|
    	t.string :name, index: true
    	t.string :value, index: true
    	t.integer :status, index: true 
    end
  end
end
