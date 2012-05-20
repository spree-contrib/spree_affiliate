module Spree
  class AfController < BaseController
    skip_before_filter  :require_no_authentication

    def show
      @user = User.find_by_ref_id(cookies[:ref_id])
    end
  end
end