json.extract! album_comment, :id, :users_id, :album_id, :body, :created_at, :updated_at
json.url album_comment_url(album_comment, format: :json)