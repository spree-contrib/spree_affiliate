User.class_eval do
  def ref_id
    self.id.to_s.reverse
  end
  
  def self.find_by_ref_id(ref_id)
    User.find(ref_id.to_s.reverse)
  end
end
