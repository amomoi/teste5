class AddLsToSensors < ActiveRecord::Migration[6.1]
  def change
    add_column :sensors, :Ls, :float
  end
end
