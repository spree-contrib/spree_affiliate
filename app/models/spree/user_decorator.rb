Spree.user_class.class_eval do

  has_many :affiliates, :class_name => 'Spree::Affiliate', :foreign_key => "partner_id", :dependent => :destroy
  has_many :referred_users, :class_name => Spree.user_class.to_s, :through => :affiliates
  has_one :affiliate_partner, :class_name => "Spree::Affiliate", :foreign_key => "user_id", :dependent => :destroy

  def referred_by
    affiliate_partner.try(:partner)
  end

  def referred_by?(user)
    referred_by and referred_by == user
  end

  def ref_id
    self.id.to_s.reverse
  end

  def self.find_by_ref_id(ref_id)
    Spree.user_class.find_by_id(ref_id.to_s.reverse)
  end
end
