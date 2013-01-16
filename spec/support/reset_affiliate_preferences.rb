def reset_affiliate_preferences
  Spree::Preferences::Store.instance.persistence = false
  config = Rails.application.config.spree.affiliate_preferences
  config.reset
  yield(config) if block_given?
end
