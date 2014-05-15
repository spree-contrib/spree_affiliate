Spree::User.class_eval do

  has_many :affiliates,
    class_name: 'Spree::Affiliate',
    foreign_key: 'partner_id'
  has_many :referred_users,
    class_name: 'Spree::User',
    through: :affiliates,
    source: :user
  has_one :affiliate_partner,
    class_name:'Spree::Affiliate',
    foreign_key: 'user_id'

  def referred_by
    affiliate_partner.try :partner
  end

  def ref_id
    self.id.to_s.reverse
  end

  def ref_token
    Base64.encode64 email
  end

  def self.find_by_ref_id(ref_id)
    Spree::User.find(ref_id.to_s.reverse)
  end
end
