module ApplicationHelper
  def current_controller?(controller)
    params[:controller] == controller
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction)
  end
end
