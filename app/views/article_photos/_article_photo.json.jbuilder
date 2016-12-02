json.extract! article_photo, :id, :article_id, :created_at, :updated_at
json.url article_photo_url(article_photo, format: :json)