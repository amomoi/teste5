class CreateTipoSensors < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_sensors do |t|
      t.string :tipo_sensor

      t.timestamps
    end
  end
end
