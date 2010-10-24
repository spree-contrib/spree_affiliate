UsersController.class_eval do
  after_filter :check_affiliate, :only => :create

  private

  def check_affiliate
    return if cookies[:ref_id].nil?
    sender = User.find_by_ref_id(cookies[:ref_id])
    affiliate = sender.affiliates.where(:affiliate_email => @user.email).first
    affiliate.update_attribute(:user_id, @user.id) if affiliate
  end
end
