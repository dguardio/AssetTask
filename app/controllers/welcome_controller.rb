class WelcomeController < ApplicationController
	def index
		@houses = House.all
		@commercial_units = CommercialUnit.all
		@complex_buildings = ComplexBuilding.all

		@combined_assets = (@houses + @commercial_units + @complex_buildings).sort_by {|record| record.created_at}

	end
end
