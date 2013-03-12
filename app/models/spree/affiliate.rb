class Spree::Affiliate < ActiveRecord::Base

  attr_accessible :user_id
  belongs_to :partner, :class_name => "Spree::User", :foreign_key => :partner_id
  belongs_to :user, :class_name => 'Spree::User'
  has_many :events, :class_name => "Spree::AffiliateEvent"

  def name
    I18n.t(:affiliate_program)
  end

  def ref_id
    partner ? partner.ref_id : ''
  end
end
