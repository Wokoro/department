class AddUnitsToRegistrations < ActiveRecord::Migration[5.0]
  def change
  	add_column :registrations, :units, :integer
  end
end
