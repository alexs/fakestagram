# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_url, as: :json
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { account_id: @post.account_id, comments_count: @post.comments_count, description: @post.description, likes_count: @post.likes_count, title: @post.title } }, as: :json
    end

    assert_response 201
  end

  test 'should show post' do
    get post_url(@post), as: :json
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { account_id: @post.account_id, comments_count: @post.comments_count, description: @post.description, likes_count: @post.likes_count, title: @post.title } }, as: :json
    assert_response 200
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post), as: :json
    end

    assert_response 204
  end
end