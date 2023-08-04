class AddFlagMantecToStatuses < ActiveRecord::Migration[6.1]
  def change
    add_column :statuses, :flag_mantec, :string
    add_column :statuses, :integer, :string
  end
end
