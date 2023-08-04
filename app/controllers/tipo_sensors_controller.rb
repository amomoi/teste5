class TipoSensorsController < ApplicationController
  before_action :set_tipo_sensor, only: %i[ show edit update destroy ]

  # GET /tipo_sensors or /tipo_sensors.json
  def index
    @tipo_sensors = TipoSensor.all
  end

  # GET /tipo_sensors/1 or /tipo_sensors/1.json
  def show
  end

  # GET /tipo_sensors/new
  def new
    @tipo_sensor = TipoSensor.new
  end

  # GET /tipo_sensors/1/edit
  def edit
  end

  # POST /tipo_sensors or /tipo_sensors.json
  def create
    @tipo_sensor = TipoSensor.new(tipo_sensor_params)

    respond_to do |format|
      if @tipo_sensor.save
        format.html { redirect_to @tipo_sensor, notice: "Tipo sensor was successfully created." }
        format.json { render :show, status: :created, location: @tipo_sensor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_sensors/1 or /tipo_sensors/1.json
  def update
    respond_to do |format|
      if @tipo_sensor.update(tipo_sensor_params)
        format.html { redirect_to @tipo_sensor, notice: "Tipo sensor was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_sensor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_sensors/1 or /tipo_sensors/1.json
  def destroy
    @tipo_sensor.destroy
    respond_to do |format|
      format.html { redirect_to tipo_sensors_url, notice: "Tipo sensor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_sensor
      @tipo_sensor = TipoSensor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_sensor_params
      params.require(:tipo_sensor).permit(:tipo_sensor)
    end
end
