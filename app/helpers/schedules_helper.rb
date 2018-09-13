module SchedulesHelper
  def action_type_str(params_str)
    Schedule.action_types.key(params_str.to_i)
  end

  def type_to_button(instance)
    content_tag(:span, instance.action_type_i18n, class: "#{instance.action_type}-label")
  end

  def default_new_termination_time
    now = DateTime.now
    DateTime.new(now.year, now.month, now.day, now.hour + 1)
  end
end
