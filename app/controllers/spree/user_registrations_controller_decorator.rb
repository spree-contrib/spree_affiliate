Spree::UserRegistrationsController.class_eval do
  include AffiliateCredits

  after_action :check_affiliate, only: :create
end

