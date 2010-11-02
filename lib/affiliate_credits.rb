module AffiliateCredits
  private

  def create_affiliate_credits(sender, recipient, event)
    #check if sender should receive credit on affiliate register
    if sender_credit_amount = Spree::Config["sender_credit_on_#{event}_amount".to_sym] and sender_credit_amount.to_f > 0
      StoreCredit.create(:amount => sender_credit_amount,
                         :remaining_amount => sender_credit_amount,
                         :reason => "Affiliate: #{event}", :user => sender)
    end

    #check if affiliate should recevied credit on sign up
    if recipient_credit_amount = Spree::Config["recipient_credit_on_#{event}_amount".to_sym] and recipient_credit_amount.to_f > 0
      StoreCredit.create(:amount => recipient_credit_amount,
                         :remaining_amount => recipient_credit_amount,
                         :reason => "Affiliate: #{event}", :user => recipient)
    end

  end

end
