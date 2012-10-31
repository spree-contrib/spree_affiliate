require 'spec_helper'

module Spree
  describe Order do
    let(:sender) { create(:user) }
    let(:user) do
      create(:user).tap do |_user|
        _user.create_affiliate_partner({:partner => sender}, :without_protection => true)
      end
    end

    let(:order) { create(:completed_order_with_totals, :user => user) }
    let(:order2) { create(:completed_order_with_totals, :user => user) }

    context 'when sender_credit_on_order_paid_amount > 0' do
      before do
        SpreeAffiliate::Config[:sender_credit_on_order_paid_amount] = 30
      end

      it "creates amount correctly when order.payment_state is paid" do
        create(:line_item, :order => order)
        payment = create(:payment, :order => order, :amount => 20)
        order.reload
        expect do
          payment.complete! # Payment.update_order is called in spree_core/payment.rb
        end.to change(StoreCredit, :count).by(1)
        credit = Spree::StoreCredit.last
        credit.user.should == sender
      end

      it "should not create multiple store credits on multiple order update" do
        create(:line_item, :order => order)
        payment = create(:payment, :order => order, :amount => 20)
        expect do
          order.reload
          payment.complete!
          2.times { order.update! }
        end.to change(StoreCredit, :count).by(1)
        credit = Spree::StoreCredit.last
        credit.user.should == sender
      end

      it "should not create multiple store credits on multiple recipient orders" do
        create(:line_item, :order => order)
        create(:line_item, :order => order2)
        payment = create(:payment, :order => order, :amount => 20)
        payment2 = create(:payment, :order => order2, :amount => 20)
        expect do
          order.reload
          order2.reload
          payment.complete!
          payment2.complete!
          2.times do
            order.update!
            order2.update!
          end
        end.to change(StoreCredit, :count).by(1)
        credit = Spree::StoreCredit.last
        credit.user.should == sender
      end
    end
  end
end