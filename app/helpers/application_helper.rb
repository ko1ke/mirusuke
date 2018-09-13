module ApplicationHelper
  APP_NAME = 'SubaCo'

  def current_time
    Time.now.strftime('%Y/%m/%d %H:%M')
  end

  def header_color
    return "light-blue lighten-1" unless @action_type
    "#{@action_type}-color"
  end

end
