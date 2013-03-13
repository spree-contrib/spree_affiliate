Spree::UserRegistrationsController.class_eval do
  include AffiliateCredits

  after_filter :check_affiliate, :only => :create
end
