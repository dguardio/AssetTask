class WelcomeController < ApplicationController
	require 'very_long_task'
	# before_action :set_purchase, only: [:buy]
	def index
		@houses = House.all.to_a
		@commercial_units = CommercialUnit.all.to_a
		@complex_buildings = ComplexBuilding.all.to_a

		@combined_assets = (@houses + @commercial_units + @complex_buildings).sort_by {|record| record.created_at}.reverse!
	end

	def manager_link
		
	end

	def buy
		# execute task
		@purchase = Purchase.new(purchase_params)
		if @purchase.save!
			run_task = VeryLongTask.new.perform
			if run_task == true
				WelcomeMailer.with(purchase: @purchase).new_purchase_email.deliver
				WelcomeMailer.with(purchase: @purchase).new_purchase_manager.deliver
				redirect_to root_path, notice: "Purchase successfully completed"
			end
		else
			flash.alert = "Purchase not successful"
		end		
	end

	private
		def purchase_params
			params.permit(:buyer_email, :product_id, :product_class)
		end
end
