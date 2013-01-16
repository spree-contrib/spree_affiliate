module Spree
  Order.class_eval do
    include AffiliateCredits

    register_update_hook :create_affiliate_credits_on_paid

    def create_affiliate_credits_on_paid
      return unless user_referred?
      return unless eligible_affiliate_credits_on_paid?

      if sender_credit_amount = SpreeAffiliate::Config[:sender_credit_on_order_paid_amount] and sender_credit_amount.to_f > 0
        credit = Spree::StoreCredit.create({:amount => sender_credit_amount, :remaining_amount => sender_credit_amount, :reason => "Affiliate: order paid", :user => user.referred_by}, :without_protection => true)
        log_event user.affiliate_partner, user.referred_by, credit, "order_paid"
      end
    end

    def affiliate_credited_on_paid?
      user.affiliate_partner.events.where(:name => "order_paid", :user_id => user.referred_by).exists?
    end

    def eligible_affiliate_credits_on_paid?
      payment_state == 'paid' and !affiliate_credited_on_paid?
    end

    def user_referred?
      user and user.try(:referred_by)
    end
  end
end