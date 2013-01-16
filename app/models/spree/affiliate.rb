class Spree::Affiliate < ActiveRecord::Base
  belongs_to :partner, :class_name => Spree.user_class.to_s, :foreign_key => :partner_id
  belongs_to :user, :class_name => Spree.user_class.to_s
  has_many :events, :class_name => "Spree::AffiliateEvent"

  validates_presence_of :user, :partner

  attr_accessible :user_id

  def name
    I18n.t(:affiliate_program)
  end

  def ref_id
    partner ? partner.ref_id : ''
  end
end
