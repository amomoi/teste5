class AddSenhaToUsuario < ActiveRecord::Migration[6.1]
  def change
    add_column :usuarios, :senha, :string
  end
end
