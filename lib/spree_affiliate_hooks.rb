class SpreeAffiliateHooks < Spree::ThemeSupport::HookListener
  Deface::Override.new(:virtual_path => "admin/configurations/index",
                     :name => "converted_admin_configurations_menu_404040658",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(I18n.t('captcha.captcha_settings'), admin_captcha_settings_path, I18n.t('captcha.manage_keys')) %>",
                     :disabled => false)
  Deface::Override.new(:virtual_path => "products/show",
                     :name => "converted_product_description_854642347",
                     :insert_after => "[data-hook='product_description'], #product_description[data-hook]",
                     :text => "<p class=\"email_to_friend\">
        <%= link_to(t('email_to_friend.send_to_friend'), email_to_friend_url('product', @product)) %>
    </p>",
                     :disabled => false)  
  Deface::Override.new(:virtual_path => "admin/configurations/index",
                     :name => "converted_admin_configurations_menu_308554151",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(I18n.t('affiliate_settings'), admin_affiliate_settings_path, I18n.t('manage_affiliate_settings')) %>",
                     :disabled => false)
  Deface::Override.new(:virtual_path => "users/show",
                     :name => "converted_account_my_orders_575876979",
                     :insert_before => "[data-hook='account_my_orders'], #account_my_orders[data-hook]",
                     :partial => "users/affiliate",
                     :disabled => false)
                 

  
  insert_before :account_my_orders, :partial => 'users/affiliate'
  
  replace :send_mail_fields, :partial => 'email_sender/fields'
end
