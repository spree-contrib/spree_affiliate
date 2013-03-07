Spree Affiliate
===============
Allows customers to refer friends and earn store credit for each user who registers and/or orders.

You can also give store credit to the refered friends on signup and after first order.

Installation
============

1. Add to Gemfile:

        gem "spree_store_credits"
        gem "spree_affiliate"

1. Run `bundle install`
1. Run install rake task for all extensions:

        rails generate spree_store_credits:install
        rails generate spree_affiliate:install

1. Run `rake db:migrate`

