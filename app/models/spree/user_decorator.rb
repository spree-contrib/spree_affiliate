Spree::User.class_eval do

  has_many :affiliates, :foreign_key => "partner_id"
  has_one :affiliate_partner, :class_name => "Affiliate", :foreign_key => "user_id"

  def partner
    affiliate_partner.partner
  end

  def ref_id
    self.id.to_s.reverse
  end

  def find_or_create_affiliate
    Affiliate.where(:partner_id => self.id, :affiliate_email => nil).first ||
      Affiliate.create(:partner => self)
  end

  def self.find_by_ref_id(ref_id)
    User.find(ref_id.to_s.reverse)
  end
end
