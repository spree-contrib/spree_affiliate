Spree::UserRegistrationsController.class_eval do
  include AffiliateCredits

  before_action :find_affiliates, only: :show
  after_action :check_affiliate, only: :create

  private

  def find_affiliates
    @affiliates ||= current_spree_user.affiliates
  end

end

