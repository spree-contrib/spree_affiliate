module AffiliateCredits
  private

  def create_affiliate_credits(sender, recipient, event)
    #check if sender should receive credit on affiliate register
    if sender_credit_amount = SpreeAffiliate::Config["sender_credit_on_#{event}_amount".to_sym] and sender_credit_amount.to_f > 0
      credit = Spree::StoreCredit.create(:amount => sender_credit_amount,
                         :remaining_amount => sender_credit_amount,
                         :reason => "Affiliate: #{event}", :user => sender.user)

      log_event recipient.affiliate_partner, sender, credit, event
    end

    #check if affiliate should recevied credit on sign up
    if recipient_credit_amount = SpreeAffiliate::Config["recipient_credit_on_#{event}_amount".to_sym] and recipient_credit_amount.to_f > 0
      credit = Spree::StoreCredit.create(:amount => recipient_credit_amount,
                         :remaining_amount => recipient_credit_amount,
                         :reason => "Affiliate: #{event}", :user => recipient)

      log_event recipient.affiliate_partner, recipient, credit, event
    end

  end

  def log_event(affiliate, user, credit, event)
    affiliate.events.create(:reward => credit, :name => event, :user => user)
  end

end
