class RelativeTime

  attr_reader :seconds_since_midnight

  def initialize
    super()
    t = Time.new
    t_s = (t.hour * 60 + t.min) * 60 + t.sec + (t.nsec/1000000000.0)
    @seconds_since_midnight = t_s
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

end
