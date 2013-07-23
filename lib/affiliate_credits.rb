module AffiliateCredits

  private

    def create_affiliate_credits(sender, recipient, event, extra = {})
      #check if sender should receive credit on affiliate register
      if sender_credit_amount = SpreeAffiliate::Config["sender_credit_on_#{event}_amount".to_sym] and sender_credit_amount.to_f > 0
        credit = Spree::StoreCredit.create!({:amount => sender_credit_amount,
                                             :remaining_amount => sender_credit_amount,
                                             :reason => "Affiliate: #{event}", :user => sender, email: sender.email}, :without_protection => true)
        log_event recipient.affiliate_partner, sender, credit, event

        ActiveSupport::Notifications.instrument('spree.affiliate.create_credits.sender', {credit: credit, recipient: recipient , event: event, sender: sender }.merge(extra))
      end


      #check if affiliate should recevied credit on sign up
      if recipient_credit_amount = SpreeAffiliate::Config["recipient_credit_on_#{event}_amount".to_sym] and recipient_credit_amount.to_f > 0
        credit = Spree::StoreCredit.create!({:amount => recipient_credit_amount,
                                             :remaining_amount => recipient_credit_amount,
                                             :reason => "Affiliate: #{event}", :user => recipient, email: recipient.email}, :without_protection => true)
        log_event recipient.affiliate_partner, recipient, credit, event
        ActiveSupport::Notifications.instrument('spree.affiliate.create_credits.sender', {credit: credit, recipient: recipient , event: event, sender: sender}.merge(extra))
        # fire_event('spree.affiliate.create_credits.recipient', credit: credit, recipient: recipient, event: event )
      end

    end

    def log_event(affiliate, user, credit, event)
      affiliate.events.create({:reward => credit, :name => event, :user => user}, :without_protection => true)
    end

    def check_affiliate
      @user.reload if @user.present? and not @user.new_record?
      return if cookies[:ref_id].blank? || @user.nil? || @user.invalid?
      sender = Spree.user_class.find_by_ref_id(cookies[:ref_id])

      if sender
        sender.affiliates.create(:user_id => @user.id)
        #create credit (if required)
        @credited = create_affiliate_credits(sender, @user, "register")
      end

      #destroy the cookie, as the affiliate record has been created.
      cookies[:ref_id] = nil
    end
end
