require 'spec_helper'

describe DayTime do

  context "overflow / underflow " do

    it "normalizes on overflow of hours" do
      rt = DayTime.new(24,1,2,3)
      rt.hours.should == 0
      rt.minutes.should == 1
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

    it "normalizes on underflow of hours" do
      rt = DayTime.new(-3,1,2,3)
      rt.hours.should == 21
      rt.minutes.should == 1
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

    it "normalizes on overflow of minutes" do
      rt = DayTime.new(23,65,2,3)
      rt.hours.should == 0
      rt.minutes.should == 5
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

    it "normalizes on underflow of minutes" do
      rt = DayTime.new(1,-100,2,3)
      rt.hours.should == 23
      rt.minutes.should == 20
      rt.seconds.should == 2
      rt.nano_seconds.should == 3
    end

    it "normalizes on overflow of nano_seconds" do
      rt = DayTime.new(22,55,2,3600000000)
      rt.hours.should == 22
      rt.minutes.should == 55
      rt.seconds.should == 5
      rt.nano_seconds.should == 600000000
    end

    it "normalizes on underflow of nano_seconds" do
      rt = DayTime.new(22,55,2,-3600000000)
      rt.hours.should == 22
      rt.minutes.should == 54
      rt.seconds.should == 58
      rt.nano_seconds.should == 400000000
    end

  end
end
