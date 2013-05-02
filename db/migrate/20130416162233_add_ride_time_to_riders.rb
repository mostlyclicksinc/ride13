class AddRideTimeToRiders < ActiveRecord::Migration
  def change
  	add_column :riders, :ride_time, :datetime
  end
end
