class CreateAffiliateEvents < ActiveRecord::Migration
  def self.up
    create_table :spree_affiliate_events do |t|
      t.string :name
      t.integer :reward_id
      t.string :reward_type
      t.references :affiliate
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_affiliate_events
  end
end
