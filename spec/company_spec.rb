require './spec_helper'

describe Company do
  before :all do
    @user = User.new "Pepe", "Perez", "1134055324", [], []
    @called_user = User.new "Juana", "Perez", "1167055325", [], []
    @local_call1 = LocalCall.new Time.new(2016, 04, 9, 2, 2, 2), Time.new(2016, 04, 9, 2, 3, 12), @user, @called_user
    @local_call2 = LocalCall.new Time.new(2016, 04, 11, 9, 2, 2), Time.new(2016, 04, 11, 9, 3, 12), @user, @called_user
    @local_call3 = LocalCall.new Time.new(2016, 04, 11, 1, 2, 2), Time.new(2016, 04, 11, 1, 3, 12), @user, @called_user
    local_call4 = LocalCall.new Time.new(2016, 05, 11, 1, 2, 2), Time.new(2016, 05, 11, 1, 6, 12), @user, @called_user
    @user.calls = [@local_call1, @local_call2, @local_call3, local_call4]
    @company = Company.new "Telecom", [@user, @called_user]
  end

  describe "#new" do
    it "takes two parameters (name, users) and returns a Company object" do
        expect(@company).to be_an_instance_of Company
    end
  end

  describe "when ask for users calls" do
    it 'creates a receipt for an user of the specified month' do
      receipt = @company.create_receipt_for(@user, 4)
      #The created receipt must have the 3 calls of month: 4
      amount = @local_call1.cost + @local_call2.cost + @local_call3.cost + 10
      expect(receipt.calls.count).to eql(3)
      expect(receipt.total_amount).to eql(amount)
    end
  end
end
