Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
		 :name => "converted_admin_configurations_menu_294924217",
		 :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
		 :text => "<%= configurations_menu_item(I18n.t('affiliate_settings'), spree.admin_affiliate_settings_path, I18n.t('manage_affiliate_settings')) %>")

Deface::Override.new(:virtual_path => "spree/users/show",
		 :name => "converted_account_my_orders_69371225",
		 :insert_before => "[data-hook='account_my_orders'], #account_my_orders[data-hook]",
		 :partial => "spree/users/affiliate")
