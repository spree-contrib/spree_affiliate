class CreateAffiliateEvents < ActiveRecord::Migration
  def self.up
    create_table :affiliate_events do |t|
      t.string :name
      t.integer :reward_id
      t.string :reward_type
      t.references :affiliate
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :affiliate_events
  end
end
