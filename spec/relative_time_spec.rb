require 'spec_helper'

describe RelativeTime do

  it "new creates a RelativeTime" do
    lambda { RelativeTime.new }.should_not raise_error
  end

  context "time in a day" do

    it "seconds_since_midnight" do
      lambda { subject.seconds_since_midnight }.should_not raise_error
    end

  end
end
