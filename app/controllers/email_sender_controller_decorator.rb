EmailSenderController.class_eval do
  private
  
  def after_delivering_affiliate_mail
    if Affiliate.where(:affiliate_email => @mail_to_friend.recipient_email).count == 0
      affiliate = current_user.find_or_create_affiliate
      affiliate.update_attribute(:affiliate_email, @mail_to_friend.recipient_email)
    end
  end
end
