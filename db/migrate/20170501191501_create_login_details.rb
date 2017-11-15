class CreateLoginDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :login_details do |t|
    	t.string :user_name, index: true, unique: true
    	t.integer :user_id, null: false, index: true
    	t.integer :user_type, null: false
    	t.integer :activation, null: false, default: 0
    	t.string :password_digest
    end
  end
end
