class AddSiteToClientes < ActiveRecord::Migration[6.1]
  def change
    add_column :clientes, :site, :string
  end
end
