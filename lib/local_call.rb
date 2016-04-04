class LocalCall
  include Call

  COSTS = {weekend: 0.10, business_in_range: 0.20, business_remaining: 0.10}

  #Class methods
  #
  #Instance methods
  def cost
    cost_per_min = if in_business_days?
      if in_hour_range?(8,20)
        COSTS[:business_in_range]
      else
        COSTS[:business_remaining]
      end
    else
      COSTS[:weekend]
    end
    cost_per_min * duration_in_minutes
  end

  def in_hour_range? start, end_hour
    start_date.hour.between?(start, end_hour)
  end
  def in_business_days?
    !start_date.saturday? && !start_date.sunday?
  end
end
