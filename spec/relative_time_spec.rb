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
      ((t_s-rt_s)%(24*60*60)).should be_within(2).of(0)
    end

    it "hours" do
      ((subject.hours - Time.new.hour)%24).should be_within(1).of(0)
    end

    it "minutes" do
      ((subject.minutes - Time.new.min)%60).should be_within(1).of(0)
    end

    it "seconds" do
      ((subject.seconds - Time.new.sec)%60).should be_within(2).of(0)
    end

  end
end
