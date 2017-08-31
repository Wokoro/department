class CreateLoginDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :login_details do |t|
    	t.integer :user_id, null: false, index: true
    	t.string :password, index: true, null: false
    	t.integer :user_type, null: false
    	t.integer :activation, null: false, default: 0
    end
  end
end
