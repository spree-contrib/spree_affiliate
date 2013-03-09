Spree::BaseHelper.class_eval do
  def referral_url(referrer)
    root_url(:ref_id => referrer.ref_id)
  end

  def link_to_referral_url(referrer, options = {})
    url = referral_url(referrer)

    link_to(url, url, options)
  end
end
