class AddLiToSensors < ActiveRecord::Migration[6.1]
  def change
    add_column :sensors, :Li, :float
  end
end
