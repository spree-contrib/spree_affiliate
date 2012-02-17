class SpreeAffiliateHooks < Spree::ThemeSupport::HookListener
  Deface::Override.new(:virtual_path => "admin/configurations/index",
                     :name => "converted_admin_configurations_menu_404040658",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(I18n.t('captcha.captcha_settings'), admin_captcha_settings_path, I18n.t('captcha.manage_keys')) %>",
                     :disabled => false)

  
  insert_before :account_my_orders, :partial => 'users/affiliate'
  
  replace :send_mail_fields, :partial => 'email_sender/fields'
end
