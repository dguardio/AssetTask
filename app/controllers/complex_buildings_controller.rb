class ComplexBuildingsController < ApplicationController
	before_action :set_complex_building, only: [:show, :edit, :update, :destroy]


	def index
	end

	def show
	end

	def new
		@complex_building = ComplexBuilding.new
	end

	def edit
		
	end

	def create
		@complex_building = ComplexBuilding.new(house_params)
		@complex_building.complex_images.attach(params[:complex_building][:complex_images])
		if @complex_building.save!
			redirect_to @complex_building
		else
			render :new
		end
	end

	def update
		
	end

	def destroy
	end

	private
		def set_complex_building
			@complex_building = ComplexBuilding.find(params[:id])
		end

		def complex_building_params
			params.require(:complex_building).permit(:owner, :address, :units, :sqmt, :price, :complex_images, :manager_email)
		end
end