require './spec_helper'
require 'countries'

describe NacInterCall do
  before :each do
    @user = User.new "Pepe", "Perez", "1134055324", [], []
    @called_user = User.new "Juana", "Perez", "1167055325", [], []
    @nac_inter_call = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 3, 12), @user, @called_user, ISO3166::Country.new('US')
  end

  describe "#new" do
    it "takes five parameters (start_date, end_date, user, called_user, country) and returns a NacInterCall object" do
        expect(@nac_inter_call).to be_an_instance_of NacInterCall
        expect(@nac_inter_call.country).to be_an_instance_of ISO3166::Country
    end
  end

  it "returns the duration of the call." do
      #end_date - start_date / 60. Time returns seconds
      expect(@nac_inter_call.duration_in_minutes).to eql((@nac_inter_call.end_date - @nac_inter_call.start_date)/60)
  end

  describe "when ask for the call cost" do
    it "gives you the national calls cost" do
      call1 = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 4, 2), @user, @called_user, ISO3166::Country.new('AR')

      #national cost: 0.30/min
      amount = call1.duration_in_minutes * 0.30

      expect(call1.cost).to eql(amount)
    end
    it "gives you the South America calls cost" do
      call2 = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 4, 2), @user, @called_user, ISO3166::Country.new('EC')

      #SA cost: 0.50/min
      amount = call2.duration_in_minutes * 0.50

      expect(call2.cost).to eql(amount)
    end
    it "gives you the North America calls cost" do
      call3 = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 4, 2), @user, @called_user, ISO3166::Country.new('US')

      #NA cost: 0.70/min
      amount = call3.duration_in_minutes * 0.70

      expect(call3.cost).to eql(amount)
    end
    it "gives you the Europen calls cost" do
      call3 = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 4, 2), @user, @called_user, ISO3166::Country.new('ES')

      #NA cost: 0.70/min
      amount = call3.duration_in_minutes * 0.70

      expect(call3.cost).to eql(amount)
    end
    it "gives you the Other calls cost" do
      call4 = NacInterCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 4, 2), @user, @called_user, ISO3166::Country.new('AU')

      #OTHER cost: 1.50/min
      amount = call4.duration_in_minutes * 1.50

      expect(call4.cost).to eql(amount)
    end
  end
end
