class SpreeAffiliateHooks < Spree::ThemeSupport::HookListener
  Deface::Override.new(:virtual_path => "admin/configurations/index",
                     :name => "converted_admin_configurations_menu_242938330",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(I18n.t('affiliate_settings'), admin_affiliate_settings_path, I18n.t('manage_affiliate_settings')) %>",
                     :disabled => false)
  Deface::Override.new(:virtual_path => "users/show",
                     :name => "converted_account_my_orders_347563100",
                     :insert_before => "[data-hook='account_my_orders'], #account_my_orders[data-hook]",
                     :partial => "users/affiliate",
                     :disabled => false)
  
  replace :send_mail_fields, :partial => 'email_sender/fields'
end
