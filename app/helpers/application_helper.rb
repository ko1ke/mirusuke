module ApplicationHelper
  APP_NAME = 'MiruSuke'

  def header_color
    return "light-blue lighten-1" unless @action_type
    "#{@action_type}-color"
  end

end
