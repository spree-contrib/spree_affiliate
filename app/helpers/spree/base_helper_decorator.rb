Spree::BaseHelper.class_eval do
  def referral_link(referrer)
    root_url(:ref_id => referrer.ref_id)
  end
end
