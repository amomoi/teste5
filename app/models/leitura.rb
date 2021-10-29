class Leitura < ApplicationRecord
  belongs_to :sensor


    before_save :check_status

    def check_status

      valor_anterior = Leitura.where("sensor_id = ?", sensor_id).select(:valor).last
      p valor_anterior.valor
      p valor
      
      limite_inferior = Sensor.where("id = ?", sensor_id).select(:Li).pluck(:Li)
      p "valor da VARIÁVEL"
      #limite_inferior.each do |limite_inferior|
        p limite_inferior[0]
      #end

      limite_superior = Sensor.where("id = ?", sensor_id).select(:Ls).pluck(:Ls)
      #limite_superior.each do |limite_superior|
        p limite_superior[0]
      #end

      flag_notificacao = Status.where("sensor_id = ?", sensor_id).select(:flag).last
      p flag_notificacao.flag

      flag_rearme = Status.where("sensor_id = ?", sensor_id).select(:flag_rearme).last
      p flag_rearme.flag_rearme

      flag_mantec = Status.where("sensor_id = ?", sensor_id).select(:flag_mantec).last
      p flag_mantec.flag_mantec

      #LÓGICA PARA SENSORES COM LI
      if flag_mantec = 0
          if valor <= limite_inferior[0]
            cliente = Sensor.where("id = ?", sensor_id).select(:cliente_id).pluck(:cliente_id)
            p cliente[0]
            celular = Usuario.where("cliente_id = ?", cliente[0]).select(:celular)
            celular.each do |celular|
              enviarSMS(celular.celular, cliente[0])
              p "Ativou SMS enviando para celular #{celular.celular} e cliente #{cliente[0]} " 
            end
          end
      else #flag_mantec = 1
        flag_notificacao = 0
        flag_rearme = 0
        p "Ativou Manutenção"
      end

    end
  end

  public
  
  def enviarSMS(numero_celular, numero_cliente)
    p "Enviou para #{numero_celular} do cliente #{numero_cliente}!"
  end