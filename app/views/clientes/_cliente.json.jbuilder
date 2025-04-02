json.extract! cliente, :id, :email, :password, :password_confirmation, :name, :rol, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
