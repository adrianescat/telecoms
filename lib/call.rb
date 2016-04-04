module Call
  attr_accessor :start_date, :end_date, :user, :called_user

  def initialize start_date, end_date, user, called_user
    @start_date = start_date
    @end_date = end_date
    @user = user
    @called_user = called_user
  end

  def duration_in_minutes
    (end_date - start_date)/60
  end
end
