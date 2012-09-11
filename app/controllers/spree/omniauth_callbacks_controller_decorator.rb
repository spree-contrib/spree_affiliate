Spree::OmniauthCallbacksController.class_eval do
  include AffiliateCredits
  after_filter :check_affiliate, :on => :facebook
end if defined?(SpreeSocial)
