UsersController.class_eval do
  include AffiliateCredits

  after_filter :check_affiliate, :only => :create

  private

  def check_affiliate
    return if cookies[:ref_id].blank? or @user.invalid?
    sender = User.find_by_ref_id(cookies[:ref_id])

    if sender
      #see if email address used is an invited affiliate
      affiliate = sender.affiliates.where(:affiliate_email => @user.email).first

      #if none exist create an affiliate
      if affiliate.nil? && Affiliate.where(:affiliate_email => @user.email).count == 0
        affiliate = sender.affiliates.create(:affiliate_email => @user.email)
      else
        #affiliate is registered to a different account (other than the ref_id above). what should we do?
      end

      #link affiliate record with newly registered user
      if affiliate and affiliate.user.nil?
        affiliate.update_attribute(:user_id, @user.id)
      end

      #create credit (if required)
      create_affiliate_credits(sender, @user, "register")
    end

    #destroy the cookie, as the affiliate record has been created.
    cookies[:ref_id] = nil
  end
end
