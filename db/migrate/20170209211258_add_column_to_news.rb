class AddColumnToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :enc_id, :string
  end
end
