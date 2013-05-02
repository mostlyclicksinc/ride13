class AddAndChangeColumnsToRiders < ActiveRecord::Migration
  def change
  	rename_column :riders, :name, :last_name
  	add_column :riders, :first_name, :string
  	add_column :riders, :rider_gender, :string
  	add_column :riders, :club_team, :string
  	add_column :riders, :rider_cat, :string
  	add_column :riders, :rider_class, :string
  	add_column :riders, :race_entered, :string
  	add_column :riders, :road_cat, :string
  end
end
