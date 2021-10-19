class Leitura < ApplicationRecord
  belongs_to :sensor


    after_save :check_status

    def check_status
      values = ActiveRecord::Base.connection.exec_query("select * from clientes")
      p values
    end
  end