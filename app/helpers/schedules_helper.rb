module SchedulesHelper
  def type_to_button(instance)
    content_tag(:span, instance.action_type_i18n, class: "#{instance.action_type}-label")
  end

  def format_time(time_obj)
    time_obj.strftime('%m/%d-%H:%M')
  end

end
