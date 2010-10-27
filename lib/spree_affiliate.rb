require 'spree_core'
require 'spree_affiliate_hooks'

module SpreeAffiliate
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env == "production" ? require(c) : load(c)
      end
      if Spree::Captcha::Config.instance
        Spree::Captcha::Config.set(:use_captcha => false)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
