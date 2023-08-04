class CreateSensors < ActiveRecord::Migration[6.1]
  def change
    create_table :sensors do |t|
      t.string :nome_sensor
      t.references :cliente, null: false, foreign_key: true
      t.references :tipo_sensor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
