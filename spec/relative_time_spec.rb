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

    it "seconds_since_midnight should be BigDecimal" do
      subject.seconds_since_midnight.should be_kind_of(BigDecimal)
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

    it "new with argument hours" do
      RelativeTime.new(10).hours.should == 10
      rt = RelativeTime.new(20)
      rt.hours.should == 20
      rt.minutes.should == 0
      rt.seconds.should == 0
      rt.nano_seconds.should == 0
    end

    it "new with argument minutes" do
      rt = RelativeTime.new(10,25)
      rt.minutes.should == 25
      rt.seconds.should == 0
      rt.nano_seconds.should == 0
    end

    it "new with argument seconds" do
      rt = RelativeTime.new(10,37,45)
      rt.seconds.should == 45
      rt.nano_seconds.should == 0
    end

    it "new with argument nano_seconds" do
      rt = RelativeTime.new(0,23,45,457834889)
      rt.nano_seconds.should == 457834889
    end

  end

  context "overflow / underflow " do

    it "normalizes on overflow of hours" do
      rt = RelativeTime.new(24,1,2,3)
      rt.hours.should == 0
      rt.minutes.should == 1
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

    it "normalizes on underflow of hours" do
      rt = RelativeTime.new(-3,1,2,3)
      rt.hours.should == 21
      rt.minutes.should == 1
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

    it "normalizes on overflow of minutes" do
      rt = RelativeTime.new(23,65,2,3)
      rt.hours.should == 0
      rt.minutes.should == 5
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

    it "normalizes on underflow of minutes" do
      rt = RelativeTime.new(1,-100,2,3)
      rt.hours.should == 23
      rt.minutes.should == 20
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

  end

  context "output" do

    it "does HH:MM:SS for to_s" do
      subject.to_s.should match(/\d{2}:\d{2}:\d{2}/)
    end

    it "does correct hours, minutes, seconds for to_s" do
      rt = RelativeTime.new(0,23,45,457834889)
      rt.to_s.should == "00:23:45"
    end

  end
end
