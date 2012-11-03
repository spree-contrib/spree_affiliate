require 'spec_helper'

describe Spree.user_class do
  let(:user) { Spree.user_class.new(:email => "foo@bar.com", :password => "secret", :password_confirmation => "secret") }
 	it "should have ref id" do
 	  user.ref_id.should_not == nil
 	end
end
