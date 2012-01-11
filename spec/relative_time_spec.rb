require 'spec_helper'

describe RelativeTime do

  it "new creates a RelativeTime" do
    lambda { subject }.should_not raise_error
  end

  context "time in a day" do

    it "seconds_since_midnight" do
      lambda { subject.seconds_since_midnight }.should_not raise_error
    end

    it "new creates a RelativeTime close to now" do
      rt_s = subject.seconds_since_midnight
      t = Time.new
      t_s = (t.hour*60 + t.min)*60 + t.sec # seconds_since_midnight from Time
      ((t_s-rt_s)%(24*60*60)).abs.should be < 10
    end

  end
end
