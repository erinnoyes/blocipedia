class ChargesController < ApplicationController

  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Upgrade to Premium",
     amount: 1500
   }
 end

  def create
   @amount = 1500
   customer = Stripe::Customer.create(
     :email => current_user.email,
     :source => params[:stripeToken]
   )

   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: @amount,
     description: "Blocipedia Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:notice] = "Payment received.  #{current_user.email} is now a Premium member!"
   redirect_to users_show_path

   current_user.update_attribute(:role, 'premium')


   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to users_show_path
 end
end
