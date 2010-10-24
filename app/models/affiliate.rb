class Affiliate < ActiveRecord::Base
  belongs_to :partner, :class_name => "User", :foreign_key => :partner_id
  belongs_to :user

  def name
    I18n.t(:affiliate_program)
  end
end

=begin
class Affiliate
  extend ActiveModel::Naming

  def initialize(user)
    @user = user
  end
  
  def to_param
    @user.ref_id
  end
  
  def name
    I18n.t(:affiliate_program)
  end
  
  class << self

    def find_by_id(id)
      user = User.find_by_ref_id(id)
      Affiliate.new(user)
    end
  
    alias :find :find_by_id

  end
end
=end
