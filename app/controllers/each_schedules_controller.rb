class EachSchedulesController < ApplicationController

  def index
    @schedules = Schedule.where(user_id: current_user.group.users).today
    gon.arr_for_chart = []

    @schedules.each do |schedule|
      username = User.find(schedule.user_id).username
      type = schedule.action_type_i18n

      start_time = schedule.start_time < Date.today.beginning_of_day ?
                       js_time_str(Date.today.beginning_of_day) : js_time_str(schedule.start_time)
      termination_time = schedule.termination_time > Date.today.end_of_day ?
                             js_time_str(Date.today.end_of_day) : js_time_str(schedule.termination_time)
      gon.arr_for_chart << [username, type, start_time, termination_time]
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def js_time_str(datetime_obj)
    datetime_obj.to_s.gsub(/\s?\+09:?00/, '').gsub(" ", 'T')
  end

end
