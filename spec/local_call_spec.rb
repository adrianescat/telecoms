require './spec_helper'

describe LocalCall do
  before :each do
    @user = User.new "Pepe", "Perez", "1134055324", [], []
    @called_user = User.new "Juana", "Perez", "1167055325", [], []
    @local_call = LocalCall.new Time.new(2016, 04, 2, 2, 2, 2), Time.new(2016, 04, 2, 2, 3, 12), @user, @called_user
  end

  describe "#new" do
    it "takes four parameters (start_date, end_date, user, called_user) and returns a LocalCall object" do
        expect(@local_call).to be_an_instance_of LocalCall
    end
  end

  it "returns the duration of the call." do
      #end_date - start_date / 60. Time returns seconds
      expect(@local_call.duration_in_minutes).to eql((@local_call.end_date - @local_call.start_date)/60)
  end

  describe "when ask for the call cost" do
    it "returns the cost for weekend days" do
      call1 = LocalCall.new Time.new(2016, 04, 9, 2, 2, 2), Time.new(2016, 04, 9, 2, 3, 12), @user, @called_user
      #Saturday and Sunday 0.10/min
      amount = call1.duration_in_minutes * 0.10

      expect(call1.cost).to eql(amount)
    end
    it "returns the cost for business days 8hs to 20hs" do
      call2 = LocalCall.new Time.new(2016, 04, 11, 9, 2, 2), Time.new(2016, 04, 11, 9, 3, 12), @user, @called_user
      #Business days between 8 and 20 hs 0.20/min
      amount = call2.duration_in_minutes * 0.20

      expect(call2.cost).to eql(amount)
    end
    it "returns the cost for business days (remaining hours)" do
      call3 = LocalCall.new Time.new(2016, 04, 11, 1, 2, 2), Time.new(2016, 04, 11, 1, 3, 12), @user, @called_user
      #Business days between remaining hours 0.10/min
      amount = call3.duration_in_minutes * 0.10

      expect(call3.cost).to eql(amount)
    end
  end
end
