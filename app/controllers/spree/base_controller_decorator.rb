Spree::BaseController.class_eval do
  before_filter :remember_affiliate

  private
  
  def remember_affiliate
    cookies.permanent[:ref_id] = params[:ref_id] if params[:ref_id]
  end
end
