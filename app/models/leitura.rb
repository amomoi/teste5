class Leitura < ApplicationRecord
  belongs_to :sensor


    before_save :check_status

    def check_status
           
      limite_inferior = Sensor.where("id = ?", sensor_id).select(:Li).pluck(:Li)
      p "valor da VARIÁVEL"
      #limite_inferior.each do |limite_inferior|
        p limite_inferior[0]
      #end

      limite_superior = Sensor.where("id = ?", sensor_id).select(:Ls).pluck(:Ls)
      #limite_superior.each do |limite_superior|
        p limite_superior[0]
      #end

      valor_anterior = Leitura.where("sensor_id = ?", sensor_id).select(:valor).last
        if valor_anterior = 'nil'
          valor_anterior = limite_inferior[0] + 1
        else 
          p valor_anterior.valor
          p valor
        end
        
      flag_notificacao = Status.where("sensor_id = ?", sensor_id).select(:flag).last
        if flag_notificacao = 'nil'
          flag_notificacao = 0
        else 
          p flag_notificacao.flag
        end

      flag_rearme = Status.where("sensor_id = ?", sensor_id).select(:flag_rearme).last
        if flag_rearme = 'nil'
          flag_rearme = 0
        else 
          p flag_rearme.flag_rearme
        end

      flag_mantec = Status.where("sensor_id = ?", sensor_id).select(:flag_mantec).last
        if flag_mantec = 'nil'
          flag_mantec = 0
        else 
          p flag_mantec.flag_mantec
        end
      

      #LÓGICA PARA SENSORES COM LI
      if flag_mantec = 0
          if valor <= limite_inferior[0]
            cliente = Sensor.where("id = ?", sensor_id).select(:cliente_id).pluck(:cliente_id)
            p cliente[0]
            celular = Usuario.where("cliente_id = ?", cliente[0]).select(:celular)
            celular.each do |celular|
              p "Ativou SMS enviando para celular #{celular.celular} e cliente #{cliente[0]} " 
              enviarSMS(celular.celular, cliente[0])
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
    p "Enviou SMS para #{numero_celular} e cliente numero #{numero_cliente}!"
    # <%= let data = {
    #             "smss": [
    #                 {
    #                     "numero": "#{numero_celular}",
    #                     "idCustom": "numero_cliente",
    #                     "mensagem": "Envio teste de SMS para Mainha - envia zap que recebeu este SMS"
    #                 },
    #                 # {
    #                 #    "numero": "11995672927",
    #                 #     "idCustom": "2",
    #                 #    "mensagem": "Envio teste 2 de SMS para Paty"
    #                 # },
    #             ],
    #             "envioImediato": true,
    #             "centroCusto": "6141f787b62e99838c27e9dd",
    #         };

           
    #         fetch('https://v2.bestuse.com.br/api/v1/envioApi?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6ImFtcG0iLCJfaWQiOiI2MTQxZjc4N2I2MmU5OTgzOGMyN2U5ZGQiLCJjbGllbnRlIjoiNjE0MWY3NjBiNjJlOTk4MzhjMjdlOWNmIiwic2FsZG8iOjE1LCJieUNDIjp0cnVlLCJpYXQiOjE2MzE3MjAzMjR9.3v4zB9VN4U18yf2syyH5djYnf_drkTViTfOV4EdSYcQ', {
    #                 method: "POST",
    #                 #mode: 'no-cors',
    #                 body: JSON.stringify(data),
    #                 headers: {
    #                     'Accept': 'application/json',
    #                     'Content-Type': 'application/json'
    #                     },
    #             })

    #             # Converting to JSON
    #             #.then(response => response.json())
    #             # Displaying results to console
    #             #.then(json => console.log(json));
    #              %>
  end