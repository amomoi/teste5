class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :cpf
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
