# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  content    :text
#

require 'spec_helper'

describe Post do
  describe '.new' do
    before do
      @post = Post.new
    end

    it 'should return a new Post' do
      @post.should_not be_nil
      @post.class.should eq(Post)
    end

    it 'should have a title attribute' do
      @post.should respond_to(:title) # @post.title
    end

    it 'should have a content attribute' do
      @post.should respond_to(:content) # @post.content
    end
  end

  describe '.create' do
    context 'without a title' do
      before do
        @post = Post.create
      end

      it "should not be valid" do
        @post.valid?.should be_false
      end

      it "should populate the errors array" do
        @post.errors.should_not be_empty
      end
    end

    context 'with a title' do
      pending
    end
  end
end
