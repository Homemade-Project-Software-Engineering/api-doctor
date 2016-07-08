class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  # GET /alarms
  # GET /alarms.json
  def index
    @alarms = Alarm.all
    render :json => @alarms
  end

  # GET /alarms/1
  # GET /alarms/1.json
  def show
    @alarm = Alarm.find(params[:id])
    render :json => @alarm
  end

  # GET /alarms/new
  def new
    @alarm = Alarm.new
  end

  # GET /alarms/1/edit
  def edit
  end

  # POST /alarms
  # POST /alarms.json
  def create

    @alarm = Alarm.new(alarm_params)
    @alarm.user_id = alarm_params[:user_id]

    respond_with(@alarm) do |format|
      if @alarm.save
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @alarm.as_json }
      else
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @alarm.errors.as_json }
      end
    end


  end

  # PATCH/PUT /alarms/1
  # PATCH/PUT /alarms/1.json
  def update
    respond_with(@alarm) do |format|
      if @alarm.update(alarm_params)
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @alarm.as_json }
      else
        format.html { render nothing: true, status: :unauthorized }
        format.json { render :json => @alarm.errors.as_json }
      end
    end
  end

  # DELETE /alarms/1
  # DELETE /alarms/1.json
  def destroy
    respond_with(@alarm) do |format|
      if @alarm.destroy
        format.html { render nothing: true, status: :unauthorized }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alarm
      @alarm = Alarm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.require(:alarm).permit(:user_id,:name,:checked,:description,:horario)
    end
end
