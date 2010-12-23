Spree Affiliate
===============
Allows customers to refer friends and earn store credit for each user who registers and/or orders.

You can also give store credit to the refered friends on signup and after first order.

Installation
============

1. Add to Gemfile:
  
        gem "spree_store_credits"
        gem "spree_email_to_friend"
        gem "spree_affiliate"
  
1. Run `bundle install`
1. Run install generators for all extensions:
      
        rails g spree_store_credits:install -f
        rails g spree_affiliate:install -f

1. Run `rake db:migrate`

