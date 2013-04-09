class AddRideNumberToRiders < ActiveRecord::Migration
  def change
  	add_column :riders, :rider_number, :integer
  end
end
