module ApplicationHelper
  def max_width
    if controller_name == "shops" && action_name == "index"
      "mw-md"
    elsif devise_controller?
      "mw-sm"
    else
      "mw-xl"
    end
  end
end
