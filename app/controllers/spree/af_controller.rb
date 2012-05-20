class AfController < Spree::BaseController
  skip_before_filter  :require_no_authentication

  def show
    @user = Spree::User.find_by_ref_id(cookies[:ref_id])
  end
end