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
    # TODO: Fix the issues with params and days not being included in alarm
    days = get_days(params['days'])
    time = get_time(params['alarm'].select { |k, v| k.include?('time') } )

    @alarm = Alarm.create!(name: params['alarm']['name'], time: time, days: days)
    @alarm.valid? ? flash[:notice] = 'Alarm added.' : flash[:error] = 'Alarm not valid'

    respond_to do |format|
      format.js { render 'alarm/create' }
    end
  end

  def delete
    id = params['alarm_id']
    Alarm.delete(id)

    respond_to do |format|
      format.js { render 'alarm/delete' }
    end
  end

  private

  def all_alarms
    @alarms = Alarm.all
  end

  def get_days(days)
    days.map! { |d| d.downcase.to_sym }
  end

  def get_time(times)
    times = times.values.map!(&:to_i)
    Time.new(times[0], times[1], times[2], times[3], times[4])
  end
end