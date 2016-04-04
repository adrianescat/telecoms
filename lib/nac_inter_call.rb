class NacInterCall
  require 'countries'
  include Call
  attr_accessor :country

  COSTS = {north_america: 0.70, europe: 0.70, south_america: 0.50, other: 1.5, national: 0.30}

  NATIONAL_COUNTRY = "AR"

  #Constructor
  def initialize start_date, end_date, user, called_user, country
    super(start_date, end_date, user, called_user)
    @country = country
  end

  #Class methods
  #
  #Instance methods
  def cost
    cost_per_min = if national_call?
      COSTS[:national]
    else
      COSTS.has_key?(continent_to_sym) ? COSTS[continent_to_sym] : COSTS[:other]
    end
    cost_per_min * duration_in_minutes
  end

  def continent_to_sym
    country.continent.downcase.split(" ").join("_").to_sym
  end

  def national_call?
    country.alpha2 == NATIONAL_COUNTRY
  end
end
