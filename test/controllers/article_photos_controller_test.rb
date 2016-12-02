require 'test_helper'

class ArticlePhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article_photo = article_photos(:one)
  end

  test "should get index" do
    get article_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_article_photo_url
    assert_response :success
  end

  test "should create article_photo" do
    assert_difference('ArticlePhoto.count') do
      post article_photos_url, params: { article_photo: { article_id: @article_photo.article_id } }
    end

    assert_redirected_to article_photo_url(ArticlePhoto.last)
  end

  test "should show article_photo" do
    get article_photo_url(@article_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_photo_url(@article_photo)
    assert_response :success
  end

  test "should update article_photo" do
    patch article_photo_url(@article_photo), params: { article_photo: { article_id: @article_photo.article_id } }
    assert_redirected_to article_photo_url(@article_photo)
  end

  test "should destroy article_photo" do
    assert_difference('ArticlePhoto.count', -1) do
      delete article_photo_url(@article_photo)
    end

    assert_redirected_to article_photos_url
  end
end
