require 'spec_helper'

describe BBCoder::BufferTags do

  subject { BBCoder::BufferTags.new(BBCoder::Buffer.new) }

  context "#criteria_met?" do
    it "should return false when tag does not exist" do
      subject.criteria_met?(:notatag).should == false
    end

    it "should return false when open tags does not include parents of tag to be added" do
      subject.criteria_met?(:li).should == false
    end

    it "should return true when open tags does include parents of tag to be added" do
      subject.push("ul")
      subject.criteria_met?(:li).should == true
    end

    it "should return false when current open tag does not have any required parents" do
      subject.criteria_met?(:p).should == true
    end
  end

  context "delegation to _internal" do
    it "#size" do
      mock(subject)._internal.stub!.size
      subject.size
    end

    it "#empty?" do
      mock(subject)._internal.stub!.empty?
      subject.empty?
    end
    it "#last" do
      mock(subject)._internal.stub!.last
      subject.last
    end

    it "#include?" do
      mock(subject)._internal.stub!.include?
      subject.include?(:p)
    end
  end
end

