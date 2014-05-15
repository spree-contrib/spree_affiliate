Spree::BaseController.class_eval do
  before_filter :remember_affiliate

  private
  
  def remember_affiliate
    cookies.permament[:ref_token] = params[:ref_token] if params[:ref_token]
  end
end
