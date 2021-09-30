class AddCelularToUsuarios < ActiveRecord::Migration[6.1]
  def change
    add_column :usuarios, :celular, :string
  end
end
