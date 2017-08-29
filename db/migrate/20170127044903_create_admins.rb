class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name, default: 'elect_elect_admin_name'
      t.string :password_digest
      t.string :password, index: true, null: false, default: 'elect_elect_admin_password'
      t.timestamps
    end
  end
end