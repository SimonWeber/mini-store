module ApplicationHelper
  def current_controller?(controller)
    params[:controller] == controller
  end
end
