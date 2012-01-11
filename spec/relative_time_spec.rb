require 'spec_helper'

describe RelativeTime do
  context "time in a day" do
    it "new creates a RelativeTime" do
      lambda { RelativeTime.new }.should_not raise_error
    end
  end
end
