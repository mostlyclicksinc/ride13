class AddFinishTimeToRiders < ActiveRecord::Migration
  def change
  	add_column :riders, :finish_time, :datetime
  end
end
