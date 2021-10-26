class Leitura < ApplicationRecord
  belongs_to :sensor


    after_save :check_status

    def check_status
      id_sensor = ActiveRecord::Base.connection.exec_query("select * from clientes")
      p id_sensor

    end
  end