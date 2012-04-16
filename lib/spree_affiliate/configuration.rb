module Spree
  class AuthConfiguration < Preferences::Configuration
    preference :registration_step, :boolean, :default => true
    preference :signout_after_password_change, :boolean, :default => true
  end
end


module Spree
  class AffiliateConfiguration < Spree::Preferences::Configuration
    preference :sender_credit_on_purchase_amount, :decimal, :default => 0.0
    preference :sender_credit_on_register_amount, :decimal, :default => 0.0
    preference :recipient_credit_on_register_amount, :decimal, :default => 0.0
    preference :recipient_credit_on_purchase_amount, :decimal, :default => 0.0
  end
end
