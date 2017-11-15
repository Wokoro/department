class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name, default: 'elect_elect_admin_name'
    end
  end
end