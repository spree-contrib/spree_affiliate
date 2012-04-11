class Spree::AffiliateEvent < ActiveRecord::Base
  belongs_to :affiliate, :class_name => 'Spree::Affiliate'
  belongs_to :reward, :polymorphic => true
  belongs_to :user, :class_name => 'Spree::User'
end
