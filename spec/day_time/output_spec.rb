require 'spec_helper'

describe DayTime do

  context "output" do

    it "does HH:MM:SS for to_s" do
      subject.to_s.should match(/\d{2}:\d{2}:\d{2}/)
    end

    it "does correct hours, minutes, seconds for to_s" do
      rt = DayTime.new(0,23,45,457834889)
      rt.to_s.should == "00:23:45"
    end

  end
end
