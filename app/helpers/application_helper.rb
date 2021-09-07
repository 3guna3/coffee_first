module ApplicationHelper
  def max_width
    if controller_name == "shops" && action_name == "index"
      "mw-md"
    else
      "mw-xl"
    end
  end
end
