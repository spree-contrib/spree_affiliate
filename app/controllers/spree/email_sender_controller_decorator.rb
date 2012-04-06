Spree::EmailSenderController.class_eval do
  private

  def after_delivering_affiliate_mail
    emails = @mail_to_friend.recipient_email.split(/,\s?/)
    emails.each do |email|
      current_user.affiliates.create(:affiliate_email => email) if Affiliate.where(:affiliate_email => email).count == 0
    end
  end
end
