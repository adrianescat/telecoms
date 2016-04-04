class Company
  attr_accessor :name, :users

  def initialize name, users
    @name = name
    @users = users
  end

  #Class methods
  #
  #Instance methods
  def create_receipt_for user, month_number
    calls = user.calls.select{|call| call.start_date.month == month_number}
    receipt = Receipt.new(user, Time.now, calls)
    user.add_receipt(receipt)
    return receipt
  end
end
