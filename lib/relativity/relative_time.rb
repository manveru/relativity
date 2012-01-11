class RelativeTime

  require 'bigdecimal'

  attr_reader :seconds_since_midnight

  def initialize(hours = nil, minutes = nil, seconds = nil, nano_seconds = nil)
    super()
    if hours
      hh = hours.to_i
      mm = minutes.to_i
      ss = seconds.to_i
      nn = nano_seconds.to_i
    else
      t = Time.new
      hh = t.hour
      mm = t.min
      ss = t.sec
      nn = t.nsec
    end
    @seconds_since_midnight = (hh * 3600) + (mm * 60) + ss + BigDecimal(nn)/BigDecimal(1000000000)
  end

  def hours
    hours = Integer(@seconds_since_midnight/(3600)).tap do |h|
      raise "Internal ERROR in RelativeTime; hours is #{h}" if (h < 0 || h > 23)
    end
  end

  def minutes
    Integer(@seconds_since_midnight / 60) % 60
  end

  def seconds
    Integer(@seconds_since_midnight) % 60
  end

  def nano_seconds
    Integer((@seconds_since_midnight % 1) * 1000000000)
  end

  def to_s
    "23:45:35"
  end

end
