module Chart

  def my_chart(schedules)
    arr = []
    schedules.each_with_index do |schedule, index|
      order_num = (index + 1).to_s
      type = schedule.action_type_i18n
      start_time = js_time_str(schedule.start_time)
      termination_time = js_time_str(schedule.termination_time)
      arr << [order_num, type, start_time, termination_time]
    end
    arr
  end

  def group_chart(schedules)
    arr = []
    schedules.each do |schedule|
      username = User.find(schedule.user_id).username
      type = schedule.action_type_i18n

      start_time = schedule.start_time < Date.today.beginning_of_day ?
                       js_time_str(Date.today.beginning_of_day) : js_time_str(schedule.start_time)
      termination_time = schedule.termination_time > Date.today.end_of_day ?
                             js_time_str(Date.today.end_of_day) : js_time_str(schedule.termination_time)
      arr << [username, type, start_time, termination_time]
    end
    arr
  end

  private

  def js_time_str(datetime_obj)
    datetime_obj.to_s.gsub(/\s?\+09:?00/, '').gsub(" ", 'T')
  end
end