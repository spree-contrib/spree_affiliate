SpreeAffiliate
==============


Installation
============

1. Add to Gemfile:

    gem "spree_store_credits", :path => "../../store_credits"
    gem "spree_email_to_friend", :path => "../../spree-email-to-friend"
    gem "spree_affiliate", :path => "../../spree_affiliate"
    gem 'recaptcha', :require => 'recaptcha/rails', :git => 'git://github.com/rfc2822/recaptcha.git', :branch => 'rails3'

1. Run `bundle install`
1. Run install generators for all extensions
1. Run `rake db:migrate`



