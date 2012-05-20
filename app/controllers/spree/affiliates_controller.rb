class Spree::AffiliatesController < Spree::BaseController
  def show
    flash[:notice] = request.flash[:notice]
    redirect_to account_url
  end

  def new
  end
end
