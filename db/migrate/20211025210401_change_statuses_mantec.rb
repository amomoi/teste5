class ChangeStatusesMantec < ActiveRecord::Migration[6.1]
  def change
    change_column :statuses, :flag_mantec, :integer, using: 'flag_mantec::integer'
  end
end
