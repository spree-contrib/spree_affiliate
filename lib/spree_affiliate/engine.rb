module SpreeAffiliate
  class Engine < Rails::Engine
    engine_name 'spree_affiliate'

    config.autoload_paths += %W(#{config.root}/lib)


    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer "spree_affiliate.environment", :before => :load_config_initializers, :after => "spree.environment" do |app|
      Dir.glob(File.join(File.dirname(__FILE__), "../configuration.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
      app.config.spree.add_class('affiliate_preferences')
      app.config.spree.affiliate_preferences = SpreeAffiliate::Configuration.new

      SpreeAffiliate::Config = app.config.spree.affiliate_preferences
    end

    config.to_prepare &method(:activate).to_proc
  end
end