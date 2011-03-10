class CreateAffiliates < ActiveRecord::Migration
  def self.up
    create_table :affiliates do |t|
      t.integer :user_id
      t.integer :partner_id
      t.string :affiliate_email
      t.timestamps
    end
  end

  def self.down
    drop_table :affiliates
  end
end
