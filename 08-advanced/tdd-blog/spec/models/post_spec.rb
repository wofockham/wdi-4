# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  content    :text
#  published  :boolean          default(FALSE)
#  author     :string(255)
#

require 'spec_helper'

describe Post do

  it { should have_many(:comments) }

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

    it 'should have a published attribute' do
      @post.should respond_to(:published) # @post.published
    end

    it 'should have published set to false' do
      @post.published.should eq(false)
    end

    it 'should have an author attribute' do
      @post.should respond_to(:author)
    end
  end

  describe '.create' do
    context 'without a title' do
      before do
        @post = FactoryGirl.build :post, :title => nil
        @post.save # This will return false and not save.
      end

      it "should not be valid" do
        @post.valid?.should be_false
      end

      it "should not have an ID" do
        @post.id.should be_nil
      end

      it "should populate the errors array" do
        @post.errors.should_not be_empty
      end
    end

    context 'with a title' do
      before do
        @post = FactoryGirl.create :post
      end

      it "should be valid" do
        @post.valid?.should be_true
      end

      it "should have an ID" do
        @post.id.should_not be_nil
      end

      it "should not populate the errors array" do
        @post.errors.any?.should be_false
      end
    end

    context 'without an author' do
      before do
        @post = FactoryGirl.build :post, :author => nil
        @post.save
      end

      it "should not be valid" do
        @post.valid?.should_not be_true
      end
    end
  end

  describe 'draft publication system' do
    before do
      @published = FactoryGirl.create_list :post, 10, :published => true
      @draft = FactoryGirl.create_list :post, 10, :published => false
    end

    describe '.published' do
      it "should have a .published class method" do
        Post.should respond_to(:published)
      end

      it "should return the published posts" do
        Post.published.each do |post|
          post.published.should be_true
        end
      end

      it "should return ALL the published posts" do
        Post.published.count.should eq(Post.where(:published => true).count)
      end
    end

    describe '.drafts' do
      it "should have a .drafts class method" do
        Post.should respond_to(:drafts)
      end

      it "should return the draft posts" do
        Post.drafts.each do |post|
          post.published.should be_false
        end
      end

      it "should return ALL the draft posts" do
        Post.drafts.count.should eq(Post.where(:published => false).count)
      end
    end
  end
end
