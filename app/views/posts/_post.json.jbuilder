json.extract! post, :id, :titulo, :descripcion, :fecha_creacion, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
