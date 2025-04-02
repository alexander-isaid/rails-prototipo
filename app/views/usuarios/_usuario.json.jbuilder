json.extract! usuario, :id, :email, :password, :password_confirmation, :name, :rol, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
