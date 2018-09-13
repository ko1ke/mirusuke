module ApplicationHelper
  APP_NAME = 'SubaCo'

  def current_time
    Time.now.strftime('%Y/%m/%d %H:%M')
  end

  def header_color
    return "light-blue lighten-1" unless params[:type_id]
    "#{Schedule.action_types.key(params[:type_id].to_i)}-color"
  end

end
