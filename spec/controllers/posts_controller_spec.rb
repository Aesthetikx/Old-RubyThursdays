require 'spec_helper'

describe PostsController do

  describe 'GET /posts/index' do

    it 'populates @posts' do
      3.times do
        FactoryGirl.create :post
      end

      get :index

      expect(assigns(:posts)).not_to be_nil
      expect(assigns(:posts).size).to eq 3
    end

    it 'returns the correct number of posts' do
      FactoryGirl.create_list(:post, 10)

      get :index, per_page: 3

      expect(assigns(:posts).size).to eq 3
    end

    it 'returns the correct page' do
      posts = FactoryGirl.create_list(:post, 10)
      posts.sort_by!{ |post| post.date }.reverse!
      sixth_post = posts[5]

      get :index, per_page: 5, page: 2

      expect(assigns(:posts).first.id).to eq(sixth_post.id)
    end

    it 'returns the posts ordered by date' do
      posts = FactoryGirl.create_list(:post, 5)
      posts.sort_by!{ |post| post.date }.reverse!

      get :index, per_page: 10

      expect(assigns(:posts)).to eq(posts)
    end

    it 'does not return posts from the future' do
      FactoryGirl.create_list(:post, 5)
      FactoryGirl.create(:post, date: Time.now + 5.hours)

      get :index, per_page: 10

      assigns(:posts).each do |post|
        expect(post.date).to be < Time.now
      end
    end

  end

  describe 'GET /posts/:slug/show' do

    it 'populates @post' do
      post = FactoryGirl.create(:post)

      get :show, slug: post.cached_slug

      expect(assigns(:post)).not_to be_nil
      expect(assigns(:post).title).to eq post.title
    end

  end

end
