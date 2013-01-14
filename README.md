Spree Affiliate
===============
Allows customers to refer friends and earn store credit for each user who registers and/or orders.

You can also give store credit to the refered friends on signup and after first order.

Installation
============

1. Add to Gemfile:

        # Spree 1-2-stable
        gem 'spree_store_credits', :git => "git://github.com/sbounmy/spree_store_credits.git", :branch => "1-2-stable"
        gem "spree_affiliate", :git => "git@github.com:sbounmy/spree_affiliate.git", :branch => "1-2-stable"

        # Spree master (1.3)
        gem 'spree_store_credits', :git => "git://github.com/sbounmy/spree_store_credits.git", :branch => "master"
        gem "spree_affiliate", :git => "git@github.com:sbounmy/spree_affiliate.git", :branch => "master"

1. Run `bundle install`
1. Run install rake task for all extensions:

        rake spree_store_credits:install:migrations
        rails g spree_affiliate:install

1. Run `rake db:migrate`


Testing
=======

bundle exec rake test_app
