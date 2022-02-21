class LeiturasController < ApplicationController
  before_action :set_leitura, only: %i[ show edit update destroy]
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception  
  protect_from_forgery unless: -> { request.format.json? }  
  before_action :set_sensor


  # GET /leituras or /leituras.json
  def index
    releaseCrossDomain
    if @sensor == Sensor.all      
        @leituras = Leitura.all
    else 
      @leituras = Leitura.where(sensor_id: @sensor.id)
                          .where(created_at: (Time.now.midnight - 6.day)..Time.now)
                          .order('id ASC')
    end
    
  end

  # GET /leituras/1 or /leituras/1.json
  def show
  end

  # GET /leituras/new
  def new
    @leitura = Leitura.new
  end

  # GET /leituras/1/edit
  def edit
  end

  # POST /leituras or /leituras.json
  def create
    releaseCrossDomain
    @leitura = Leitura.new(leitura_params)

    respond_to do |format|
      if @leitura.save
        format.html { redirect_to @leitura, notice: "Leitura was successfully created." }
        format.json { render :show, status: :created, location: @leitura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leitura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leituras/1 or /leituras/1.json
  def update
    respond_to do |format|
      if @leitura.update(leitura_params)
        format.html { redirect_to @leitura, notice: "Leitura was successfully updated." }
        format.json { render :show, status: :ok, location: @leitura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leitura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leituras/1 or /leituras/1.json
  def destroy
    @leitura.destroy
    respond_to do |format|
      format.html { redirect_to leituras_url, notice: "Leitura was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #ação criada para enviar a última leitura na página de controle de sensores  
  def ul
    releaseCrossDomain
    @leitura = Leitura.where(sensor_id: params[:id_sensor]).last
    respond_to do |format|      
        format.html { render :show, notice: "Leitura was successfully created." }
        format.json { render :show, status: :created, location: @leitura }      
    end   

  end

  #require 'rest-client'
  require 'json'
  require 'uri'
  require 'net/http'

  def self.enviarSMS(numero_celular, numero_cliente, empresa, usuario, sensor)

     p "Enviou SMS para"
     p numero_celular
     p numero_cliente
   
      data = {
                "smss": [
                    {
                        "numero": numero_celular,
                        "idCustom": numero_cliente,
                        "mensagem": "#{empresa} - #{usuario}: Sensor #{sensor} foi ativado #{Time.now.strftime("%I:%M%p - %d/%m/%Y")}  pois atingiu o limite! Favor verificar!"
                    },
                    
                    #// {
                    #// "numero": "11995672927",
                    #//     "idCustom": "2",
                    #// "mensagem": "Envio teste via RoR"
                    #// },
                ],
                "envioImediato": true,
                "centroCusto": "6141f787b62e99838c27e9dd",
              }

             
    url = URI("http://v2.bestuse.com.br/api/v1/envioApi?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6ImFtcG0iLCJfaWQiOiI2MTQxZjc4N2I2MmU5OTgzOGMyN2U5ZGQiLCJjbGllbnRlIjoiNjE0MWY3NjBiNjJlOTk4MzhjMjdlOWNmIiwic2FsZG8iOjYsImJ5Q0MiOnRydWUsImlhdCI6MTY0MzAzMDg4NX0.-3WC5nyW9z0JLKfchEKi3aT4Pf2mlTMKHDw6F9Z6Ges")
    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6ImFtcG0iLCJfaWQiOiI2MTQxZjc4N2I2MmU5OTgzOGMyN2U5ZGQiLCJjbGllbnRlIjoiNjE0MWY3NjBiNjJlOTk4MzhjMjdlOWNmIiwic2FsZG8iOjYsImJ5Q0MiOnRydWUsImlhdCI6MTY0MzAzMDg4NX0.-3WC5nyW9z0JLKfchEKi3aT4Pf2mlTMKHDw6F9Z6Ges'
    request.body = data.to_json
    response = http.request(request)
    #puts response.read_body
    #p response           
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_sensor
      @sensor = Sensor.where(id: :sensor_id).first
      if @sensor.nil?
        @sensor = Sensor.all
      end
    end

    def set_leitura
      @leitura = Leitura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leitura_params
      params.require(:leitura).permit(:valor, :sensor_id, :cliente_id, :tipo_sensor_id, :created_at)
    end

    def sensor_params
      params.require(:sensor).permit(:nome_sensor, :Li, :Ls, :cliente_id, :tipo_sensor_id)
    end


    def releaseCrossDomain

      origin = request.headers["Origin"]
  
      if (not origin.nil?) and (origin == "https://ib.ampmsolucoes.com.br" or origin == "https://api.ampmsolucoes.com.br" or origin == "192.168.15.10")
        origin = origin
        else
          origin = ""
      end
      
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'GET, POST'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = '*'
    end
  


end