class SensorsController < ApplicationController
  before_action :set_sensor, only: %i[ show edit update destroy]
  before_action :set_cliente
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  # GET /sensors or /sensors.json
  def index
    releaseCrossDomain
    if @cliente == Cliente.all
      @sensors = Sensor.all
    else
      @sensors = Sensor.where(cliente_id: @cliente.id)
    end
  end

  # GET /sensors/1 or /sensors/1.json
  def show
  end

  # GET /sensors/new
  def new
    @sensor = Sensor.new
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors or /sensors.json
  def create
    @sensor = Sensor.new(sensor_params)
    
    respond_to do |format|
      if @sensor.save
        format.html { redirect_to cliente_sensors_path(@cliente), notice: "Sensor was successfully created." }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensors/1 or /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to cliente_sensors_path(@cliente), notice: "Sensor was successfully updated." }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1 or /sensors/1.json
  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to cliente_sensors_path(@cliente), notice: "Sensor was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_cliente
      @cliente = Cliente.where(id: params[:cliente_id]).first
      if @cliente.nil?
        @cliente = Cliente.all
      end
    end
    
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sensor_params
      params.require(:sensor).permit(:nome_sensor, :Li, :Ls, :cliente_id, :tipo_sensor_id, :time_read)
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
