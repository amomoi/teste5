json.extract! usuario, :id, :nome, :email, :cpf, :cliente_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
