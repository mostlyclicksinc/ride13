class AddOfficialStartTimeToRiders < ActiveRecord::Migration
  def change
  	add_column :riders, :official_start_time, :time
  end
end
