Spree::Order.class_eval do
include AffiliateCredits

  alias :old_finalize! :finalize!
  def finalize!
	  old_finalize!
	  if user && user.affiliate_partner && user.orders.where(:state => 'complete').count == 1
	      sender = user.referred_by
	      #create credit (if required)
	      create_affiliate_credits(sender, user, "purchase")
	   end
  end

end
