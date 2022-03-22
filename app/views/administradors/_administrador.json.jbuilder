json.extract! administrador, :id, :nome, :email, :cpf, :senha, :created_at, :updated_at
json.url administrador_url(administrador, format: :json)
