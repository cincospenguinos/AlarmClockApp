## Manages alarms and anything else I feel like making it manage.
class AlarmController < ApplicationController
  before_action :all_alarms, only: [ :index, :create ]

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @alarm = Alarm.new
  end

  def create
    @alarm = Alarm.create(alarm_params)
  end

  private

  def all_alarms
    @alarms = Alarm.all
  end

  def alarm_params
    params.require(:alarm).permit(:name, :time, :days)
  end

end
