require 'spec_helper'

describe Post do
  it 'has a valid factory' do

    post = FactoryGirl.create :post

    expect(post).to be_valid
    expect(post.title).not_to be_empty
    expect(post.body).not_to be_empty
    expect(2.years.ago..Time.now).to cover(post.date)
  end
end
