class AddManagerEmailToHouseComplexBuildingAndCommercialUnit < ActiveRecord::Migration[5.2]
  AFFECTED_TABLES = [:commercial_units, :complex_buildings, :houses]
  def change
  	AFFECTED_TABLES.each do |t|
    	add_column t, :manager_email, :string
  	end
  end
end
