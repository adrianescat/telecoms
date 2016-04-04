class Receipt
  attr_accessor :user, :delivery_date, :calls

  BASE_AMOUNT = 10

  #Constructor
  def initialize user, delivery_date, calls
    @user = user
    @delivery_date = delivery_date
    @calls = calls
  end

  #Class methods
  #
  #Instance methods
  def total_amount
    BASE_AMOUNT + amount_for(NacInterCall) + amount_for(LocalCall)
  end

  def amount_for call_type
    calls.select{|call| call.is_a? call_type}.inject(0) { |sum, call| sum + call.cost }
  end
end
