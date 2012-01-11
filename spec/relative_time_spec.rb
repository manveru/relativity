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
      (((t_s-rt_s).abs+2)%(24*60*60)).should be <= 4
    end

    it "hours" do
      (((subject.hours - Time.new.hour).abs+1)%24).should be <= 2
    end

    it "minutes" do
      (((subject.minutes - Time.new.min).abs+1)%60).should be <= 2
    end

    it "seconds" do
      (((subject.seconds - Time.new.sec).abs+2)%60).should be <= 4
    end

    it "seconds_since_midnight should be float" do
      subject.seconds_since_midnight.should be_kind_of(Float)
    end

    it "hours should be Integer" do
      subject.hours.should be_kind_of(Integer)
    end

    it "minutes should be Integer" do
      subject.minutes.should be_kind_of(Integer)
    end

    it "seconds should be Integer" do
      subject.seconds.should be_kind_of(Integer)
    end

    it "nano_seconds should be Integer" do
      subject.nano_seconds.should be_kind_of(Integer)
    end

  end
end
