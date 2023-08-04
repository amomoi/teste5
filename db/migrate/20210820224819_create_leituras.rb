class CreateLeituras < ActiveRecord::Migration[6.1]
  def change
    create_table :leituras do |t|
      t.float :valor
      t.references :sensor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
