require 'spec_helper'

describe User do
  let(:user) { User.new(:email => "foo@bar.com", :password => "secret", :password_confirmation => "secret") }
 	it "should have ref id" do
 	  user.ref_id.should_not == nil
 	end
end
