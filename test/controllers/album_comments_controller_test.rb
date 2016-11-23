require 'test_helper'

class AlbumCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_comment = album_comments(:one)
  end

  test "should get index" do
    get album_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_album_comment_url
    assert_response :success
  end

  test "should create album_comment" do
    assert_difference('AlbumComment.count') do
      post album_comments_url, params: { album_comment: { album_id: @album_comment.album_id, body: @album_comment.body, users_id: @album_comment.users_id } }
    end

    assert_redirected_to album_comment_url(AlbumComment.last)
  end

  test "should show album_comment" do
    get album_comment_url(@album_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_comment_url(@album_comment)
    assert_response :success
  end

  test "should update album_comment" do
    patch album_comment_url(@album_comment), params: { album_comment: { album_id: @album_comment.album_id, body: @album_comment.body, users_id: @album_comment.users_id } }
    assert_redirected_to album_comment_url(@album_comment)
  end

  test "should destroy album_comment" do
    assert_difference('AlbumComment.count', -1) do
      delete album_comment_url(@album_comment)
    end

    assert_redirected_to album_comments_url
  end
end
