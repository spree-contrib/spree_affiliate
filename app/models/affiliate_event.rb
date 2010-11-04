class AffiliateEvent < ActiveRecord::Base
  belongs_to :affiliate
  belongs_to :reward, :polymorphic => true
  belongs_to :user
end
