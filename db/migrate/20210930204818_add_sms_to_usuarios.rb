class AddSmsToUsuarios < ActiveRecord::Migration[6.1]
  def change
    add_column :usuarios, :sms, :integer
  end
end
