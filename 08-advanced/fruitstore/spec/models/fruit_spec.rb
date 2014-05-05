require 'spec_helper'

describe Fruit do

  it { should belong_to :stair }

  describe "An apple" do
    before do
      @apple = Apple.create(:name => 'Granny Smith Apple')
    end

    it "should have a name" do
      @apple.name.should_not be_nil
    end

    it "should not be squishy" do
      @apple.squishy?.should == false
      @apple.squishy?.should be_false
      @apple.squishy?.should eq(false)
    end

    it "should remember what class it is using single table inheritance (STI)" do
      apple = Fruit.find(@apple.id)
      apple.should_not be_nil
      apple.should_not == nil
      apple.should_not eq(nil)

      apple.class.should == Apple
      apple.class.should eq(Apple)

      apple.should == @apple
      apple.should eq(@apple)

      apple.is_a?(Fruit)
      apple.class.ancestors.should include Fruit
    end
  end

  describe "A pear" do
    before do
      @pear = Pear.create(:name => 'Nashi Pear')
    end

    it "should have a name" do
      @pear.name.should_not be_nil
    end

    it "should be kinda squishy" do
      @pear.squishy?.should == true
      @pear.squishy?.should be_true
      @pear.squishy?.should eq(true)
    end

    it "should remember what class it is using single table inheritance (STI)" do
      pear = Fruit.find(@pear.id)
      pear.should_not be_nil
      pear.should_not == nil
      pear.should_not eq(nil)

      pear.class.should == Pear
      pear.class.should eq(Pear)

      pear.should == @pear
      pear.should eq(@pear)

      pear.is_a?(Fruit).should be_true
      pear.class.ancestors.should include Fruit
    end
  end

end
