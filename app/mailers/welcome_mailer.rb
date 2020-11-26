class WelcomeMailer < ApplicationMailer
	def new_purchase_email
		@purchase = params[:purchase]

		@asset = if @purchase.product_class == "House"
						House.find(@purchase.product_id)
					elsif @purchase.product_class == "CommercialUnit"
						CommercialUnit.find(@purchase.product_id)
					else
						ComplexBuilding.find(@purchase.product_id)
					end		
		# @purchase = @details.product_class.gsub!('"', '').find(@details.product_id)
		mail(to: @purchase.buyer_email, subject: "Your Asset Purchase Successful!")
	end
	def new_purchase_manager
		@purchase = params[:purchase]
		@asset = if @purchase.product_class == "House"
						House.find(@purchase.product_id)
					elsif @purchase.product_class == "CommercialUnit"
						CommercialUnit.find(@purchase.product_id)
					else
						ComplexBuilding.find(@purchase.product_id)
					end
		mail(to: @asset.manager_email, subject: "New Purchase Successful!")
	end	
end
