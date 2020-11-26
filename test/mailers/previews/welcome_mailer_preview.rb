# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
  def new_purchase_email
  	@purchase = Purchase.all.last
  	WelcomeMailer.with(purchase: @purchase).new_purchase_email.deliver
  end
  def new_purchase_manager
  	@purchase = Purchase.all.last
  	WelcomeMailer.with(purchase: @purchase).new_purchase_manager.deliver
  end 
end
