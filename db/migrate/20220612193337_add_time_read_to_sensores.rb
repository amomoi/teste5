class AddTimeReadToSensores < ActiveRecord::Migration[6.1]
  def change
    add_column :sensors, :time_read, :integer
  end
end
