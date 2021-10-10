class AddFlagRearmeToStatuses < ActiveRecord::Migration[6.1]
  def change
    add_column :statuses, :flag_rearme, :integer
  end
end
