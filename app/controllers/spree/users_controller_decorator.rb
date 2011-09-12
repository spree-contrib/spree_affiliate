Spree::UsersController.class_eval do
  before_action :find_affiliates, only: :show

  private

  def find_affiliates
    @affiliates ||= current_spree_user.affiliates
  end

end

