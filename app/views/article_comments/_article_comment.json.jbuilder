json.extract! article_comment, :id, :user_id, :article_id, :body, :created_at, :updated_at
json.url article_comment_url(article_comment, format: :json)