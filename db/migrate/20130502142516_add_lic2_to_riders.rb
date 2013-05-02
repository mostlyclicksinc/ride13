class AddLic2ToRiders < ActiveRecord::Migration
  def change
  	add_column :riders, :license, :string
  end
end
