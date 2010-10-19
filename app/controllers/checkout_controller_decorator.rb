CheckoutController.class_eval do
  private

  def after_complete
    session[:order_id] = nil
    if current_user && cookies[:ref_id] && current_user.orders.where(:state => 'complete').count == 1
      sender = User.find_by_ref_id(cookies[:ref_id])
      if sender
        if sender_credit_amount = Spree::Config[:sender_credit_amount]
          StoreCredit.create(:amount => sender_credit_amount, 
                             :remaining_amount => sender_credit_amount, 
                             :reason => 'Affiliate Program', :user => sender)
        end
        if recipient_credit_amount = Spree::Config[:recipient_credit_amount]
          StoreCredit.create(:amount => recipient_credit_amount, 
                             :remaining_amount => recipient_credit_amount, 
                             :reason => 'Affiliate Program', :user => current_user)
        end
        cookies.permanent[:ref_id] = nil
      end
    end
  end
end
