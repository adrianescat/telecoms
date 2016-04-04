require './spec_helper'

describe User do
  before :each do
    @user = User.new "Pepe", "Perez", "1134055324", [], []
  end

  describe "#new" do
    it "takes five parameters (name, last_name, tel, receipts, calls) and returns a User object" do
        expect(@user).to be_an_instance_of User
    end
  end

  describe "when receives a receipt" do
    it 'adds it to its receipts collection' do
      receipt_count = @user.receipts.count
      receipt = Receipt.new @user, Time.new(2016, 05, 1), []
      @user.add_receipt(receipt)

      expect(@user.receipts.count).to eql(receipt_count + 1)
    end
  end
end
