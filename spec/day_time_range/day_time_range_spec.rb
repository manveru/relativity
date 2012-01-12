require 'spec_helper'

describe DayTimeRange do

  it "builds new with 1 argument" do
    lambda { DayTimeRange.new("8 until 11") }.should_not raise_error
  end

end
