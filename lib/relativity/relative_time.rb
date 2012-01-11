class RelativeTime

  attr_reader :seconds_since_midnight

  def initialize
    super()
    t = Time.new
    t_s = (t.hour * 60 + t.min) * 60 + t.sec
    @seconds_since_midnight = t_s
  end

end
