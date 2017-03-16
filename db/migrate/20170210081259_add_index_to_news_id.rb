class AddIndexToNewsId < ActiveRecord::Migration[5.0]
  def change
  	add_index :news, :id
  end
end
