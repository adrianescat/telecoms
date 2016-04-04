require './spec_helper'

describe Receipt do
  before :all do
    user = User.new "Pepe", "Perez", "1134055324", [], []
    called_user = User.new "Juana", "Perez", "1167055325", [], []
    @local_call1 = LocalCall.new Time.new(2016, 04, 9, 2, 2, 2), Time.new(2016, 04, 9, 2, 3, 12), user, called_user
    @local_call2 = LocalCall.new Time.new(2016, 04, 11, 9, 2, 2), Time.new(2016, 04, 11, 9, 3, 12), user, called_user
    @local_call3 = LocalCall.new Time.new(2016, 04, 11, 1, 2, 2), Time.new(2016, 04, 11, 1, 3, 12), user, called_user
    @national_call = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 4, 2), user, called_user, ISO3166::Country.new('AR')
    @international_call = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 4, 2), user, called_user, ISO3166::Country.new('US')
    @receipt1 = Receipt.new user, Time.new(2016, 05, 1), []
    @receipt2 = Receipt.new user, Time.new(2016, 05, 1), [@local_call1, @local_call2, @local_call3, @national_call, @international_call]
  end

  describe "#new" do
    it "takes three parameters (user, delivery_date, calls) and returns a Receipt object" do
        expect(@receipt1).to be_an_instance_of Receipt
        expect(@receipt2).to be_an_instance_of Receipt
    end
  end

  describe "when ask for different amounts" do
    it 'returns the sum of local calls' do
      #3 local calls. Must be the sum of them
      amount = @local_call1.cost + @local_call2.cost + @local_call3.cost
      expect(@receipt2.amount_for(LocalCall)).to eql(amount)
    end

    it 'returns the sum of nac_inter calls' do
      #2 National and International calls. Must be the sum of them
      amount = @national_call.cost + @international_call.cost
      expect(@receipt2.amount_for(NacInterCall)).to eql(amount)
    end

    it 'returns the base amount for a user without calls as total amount' do
      #Base amount $10
      expect(@receipt1.total_amount).to eql(10)
    end

    it 'returns the sum of local calls, nac_inter calls plus base amount as total amount' do
      #2 National and International calls and 3 local calls. Must be the sum of them plus the base amount
      amount = @national_call.cost + @international_call.cost + @local_call1.cost + @local_call2.cost + @local_call3.cost + 10
      expect(@receipt2.total_amount).to eql(amount)
    end
  end
end
