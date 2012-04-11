class Spree::Admin::AffiliateSettingsController < Spree::Admin::BaseController

  def update
    SpreeAffiliate::Config.set(params[:preferences])

    respond_to do |format|
      format.html {
        redirect_to admin_affiliate_settings_path
      }
    end
  end

end
