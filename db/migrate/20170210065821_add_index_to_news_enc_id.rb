class AddIndexToNewsEncId < ActiveRecord::Migration[5.0]
  def change
  	add_index :news, :enc_id, unique:true
  end
end
