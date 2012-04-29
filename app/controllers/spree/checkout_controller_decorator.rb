Spree::CheckoutController.class_eval do
  include AffiliateCredits

  private

  def after_complete
    session[:order_id] = nil

    if current_user && current_user.affiliate_partner && current_user.orders.where(:state => 'complete').count == 1
      sender = current_user.affiliate_partner

      #create credit (if required)
      create_affiliate_credits(sender, current_user, "purchase")
    end
  end
end
