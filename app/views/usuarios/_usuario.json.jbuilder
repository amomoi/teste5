json.extract! usuario, :id, :nome, :email, :cpf, :cliente_id, :created_at, :updated_at, :celular, :senha, :sms
json.url usuario_url(usuario, format: :json)
