class SpreeAffiliateHooks < Spree::ThemeSupport::HookListener
 insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('affiliate_settings'), admin_affiliate_settings_path, I18n.t('manage_affiliate_settings')) %>"
  end

  
  insert_before :account_my_orders, :partial => 'users/affiliate'
  
  replace :send_mail_fields, :partial => 'email_sender/fields'
end
