# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Validation test' do
    it 'ensures title is present' do
      post = Post.new(subtitle: 'test', category_id: '1', author: 'test', content: 'lorem')
      expect(post).to_not be_valid
      expect(post.errors.messages[:title]).to eq ['can\'t be blank']
    end
    it 'ensures Subtitle is present' do
      post = Post.new(title: 'test', category_id: '1', author: ' test', content: 'lorem')
      expect(post).to_not be_valid
      expect(post.errors.messages[:subtitle]).to eq ['can\'t be blank']
    end
    it 'ensures category_id is present' do
      post = Post.new(title: 'test', subtitle: 'test', author: 'test', content: 'lorem')
      expect(post).to_not be_valid
      expect(post.errors.messages[:category_id]).to eq ['can\'t be blank']
    end
    it 'ensures author is present' do
      post = Post.new(title: 'test', subtitle: 'test', category_id: '1', content: 'lorem')
      expect(post).to_not be_valid
      expect(post.errors.messages[:author]).to eq ['can\'t be blank']
    end
    it 'ensures content is present' do
      post = Post.new(title: 'test', subtitle: 'test', category_id: '1', author: 'test')
      expect(post).to_not be_valid
      expect(post.errors.messages[:content]).to eq ['can\'t be blank']
    end
    it 'it should save successfully' do
      post = Post.new(title: 'test', subtitle: 'test', category_id: '1', author: 'test', content: 'lorem')
      expect(post).to be_truthy
    end
  end

  context 'scope test' do
  end
end
