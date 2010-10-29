EmailSenderController.class_eval do
  private
  
  def after_delivering_affiliate_mail
    emails = @mail_to_friend.recipient_email.split(/,\s?/)
    emails.each do |email|
      if Affiliate.where(:affiliate_email => email).count == 0
        affiliate = current_user.find_or_create_affiliate
        affiliate.update_attribute(:affiliate_email, email)
      end
    end
  end
end
