class SpreeAffiliateHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('affiliate_settings'), admin_affiliate_settings_path, I18n.t('manage_affiliate_settings')) %>"
  end
  
  insert_before :account_my_orders do
    "<p><strong><%= I18n.t('affiliate_link') %>:</strong> <%= link_to root_url(:ref_id => current_user.ref_id), root_url(:ref_id => current_user.ref_id) %>"
  end
end
