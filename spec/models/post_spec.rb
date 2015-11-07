require 'rails_helper'

describe Post, type: :model do
  context "with default value" do
    let(:post) { create(:post) }

    it 'should be a valid post' do
      expect(post).to be_valid
    end

    it 'should have a default title' do
      expect(post.title).to be == 'My first blog'
    end

    it 'should have a default contents' do
      expect(post.contents).to be == 'Hay look, I am learning factory girl.  You can also start learning if you aren\'t'
    end

    it 'should not be published' do
      expect(post.published_at?).to be_falsey
    end
  end

  context 'with overriden contents' do
    let(:post) { create(:post, title: 'This is a published post', published_at: Time.zone.now) }

    it 'should have a new title' do
      expect(post.title).to be == 'This is a published post'
    end

    it 'should not have a default value' do
      expect(post.title).not_to be == 'My first blog'
    end
  end

  context 'with a trait' do
    # default post has a published_at nil
    let(:post) { create(:post) }

    # post with a published trait will override the value of published at
    let(:post_with_published_at_trait) { create(:post, :published) }

    it 'post with published trait should be a published post' do
      expect(post_with_published_at_trait.published_at?).to be_truthy
    end

    it 'post with out published trait shouldn\'t be published' do
      expect(post.published_at?).to be_falsey
    end
  end
end
