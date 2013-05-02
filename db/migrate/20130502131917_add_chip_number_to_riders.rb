class AddChipNumberToRiders < ActiveRecord::Migration
  def change
  	add_column :riders, :chip_id, :string
  end
end
