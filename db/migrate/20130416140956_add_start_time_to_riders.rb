class AddStartTimeToRiders < ActiveRecord::Migration
  def change
  	add_column :riders, :start_time, :datetime
  end
end
