class HousesController < ApplicationController
	before_action :set_house, only: [:show, :edit, :update, :destroy]


	def index
	end

	def show
	end

	def new
		@house = House.new
	end

	def edit
		
	end

	def create
		@house = House.new(house_params)
		@house.images.attach(params[:house][:images])
		if @house.save!
			redirect_to @house
		else
			render :new
		end
	end

	def update
		
	end

	def destroy
	end

	private
		def set_house
			@house = House.find(params[:id])
		end

		def house_params
			params.require(:house).permit(:owner, :address, :rooms, :sqmt, :floors, :air_cond, :price)
		end
end