class User
  attr_accessor :name, :last_name, :tel, :receipts, :calls

  def initialize name, last_name, tel, receipts, calls
    @name = name
    @last_name = last_name
    @tel = tel
    @receipts = receipts
    @calls = calls
  end

  #Class methods
  #
  #Instance methods
  def add_receipt receipt
    receipts << receipt
  end
end
