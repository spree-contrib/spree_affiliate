Spree::OmniauthCallbacksController.class_eval do
  include AffiliateCredits
  after_filter :check_affiliate
end if defined?(SpreeSocial)
