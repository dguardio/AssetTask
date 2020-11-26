class CommercialUnitsController < ApplicationController
	before_action :set_commercial_unit, only: [:show, :edit, :update, :destroy]


	def index
	end

	def show
	end

	def new
		@commercial_unit = CommercialUnit.new
	end

	def edit
		
	end

	def create
		@commercial_unit = CommercialUnit.new(commercial_unit_params)
		@commercial_unit.commercial_images.attach(params[:commercial_unit][:commercial_images])
		if @commercial_unit.save!
			redirect_to @commercial_unit
		else
			render :new
		end
	end

	def update
		
	end

	def destroy
	end

	private
		def set_commercial_unit
			@commercial_unit = CommercialUnit.find(params[:id])
		end

		def commercial_unit_params
			params.require(:commercial_unit).permit(:owner, :address, :shops, :sqmt, :parking, :price, :commercial_images, :manager_email)
		end
end