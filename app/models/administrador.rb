class Administrador < ApplicationRecord
    validates :nome, :email, :cpf, :senha, presence: true
end
