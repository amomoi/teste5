class Leitura < ApplicationRecord
  belongs_to :sensor

  #validates :Li, :Ls, allow_nil: true

  before_save :check_status

  def check_status
          
    limite_inferior = Sensor.where("id = ?", sensor_id).select(:Li).pluck(:Li)
    #self.Li = "" if self.Li == nil

    p limite_inferior[0]
      if !limite_inferior[0].nil?
        p "valor da VARIÁVEL"
        p "LI"
        p limite_inferior[0]
      else
      end

    limite_superior = Sensor.where("id = ?", sensor_id).select(:Ls).pluck(:Ls)
      if !limite_superior[0].nil?
        p "LS"
        p limite_superior[0]
      else
      end

    valor_anterior = Leitura.where("sensor_id = ?", sensor_id).select(:valor).last
      if valor_anterior.nil? #= 'nil'
        valor_anterior = limite_inferior[0] + 1
      else 
        p "valor anterior"
        p valor_anterior.valor
        p "valor"
        p valor
        
      end
      
    flag_notificacao = Status.where("sensor_id = ?", sensor_id).select(:flag).last
      if flag_notificacao.nil?
        flag_notificacao = 0
      else 
        p "flag notificação"
        p flag_notificacao.flag
      end

    flag_rearme = Status.where("sensor_id = ?", sensor_id).select(:flag_rearme).last
      if flag_rearme.nil?
        flag_rearme = 0
      else 
        p "flag rearme"
        p flag_rearme.flag_rearme
      end

    flag_mantec = Status.where("sensor_id = ?", sensor_id).select(:flag_mantec).last
      if flag_mantec.nil?
        flag_mantec = 0
      else 
        p "flag mantec"
        p flag_mantec.flag_mantec
      end
    

    #LÓGICA PARA SENSORES COM LI
    if flag_mantec = 0
      if !limite_inferior[0].nil? || !limite_superior[0].nil?
        if valor <= limite_inferior[0] || valor >= limite_superior[0] #checa se atingiu o valor limite (superior ou inferior)
          cliente = Sensor.where("id = ?", sensor_id).select(:cliente_id).pluck(:cliente_id)
          p cliente[0]
          nome_da_empresa = Cliente.where("id = ?", cliente[0]).select(:nome_empresa).pluck(:nome_empresa)
          p sensor.nome_sensor
          celular = Usuario.where("cliente_id = ?", cliente[0]).select(:celular).select(:sms).select(:nome)
          p celular[0]
          #sms_able = Usuario.where("cliente_id = ?", cliente[0]).select(:sms)
          #p sms_able
          #p "passou 1"
          celular.each do |celular, sms, nome|
            if celular.sms == 1
              p "#{nome_da_empresa[0]} - #{celular.nome}: Sensor #{sensor.nome_sensor} foi ativado #{Time.now.strftime("%I:%M%p - %d/%m/%Y")} pois atingiu o limite! Favor verificar!"
              #p "#{nome_da_empresa[0]}: #{celular.nome} - #{sensor.nome_sensor} foi ativado pois atingiu o limite! Favor verificar. Ativou SMS enviando para celular #{celular.celular} e cliente #{cliente[0]} "
              p "Enviou SMS por Leituras Controler"
              #LeiturasController.enviarSMS(celular.celular, cliente[0], nome_da_empresa[0], celular.nome, sensor.nome_sensor)
            end
          end

        else
          if flag_rearme.flag_rearme == 1  #checa se retornou fora dos LS e LI, se sim deixa flag_rearme = 0
            Status.where(sensor_id: sensor_id).update_all(flag_rearme: 0)
          end
        end


      else
      end
    else #flag_mantec = 1
      flag_notificacao = 0
      flag_rearme = 0
      p "Ativou Manutenção"
    end

  end
  
  

 end