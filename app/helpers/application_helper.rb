module ApplicationHelper
  def current_path?(path)
    request.fullpath == path
  end

  def active_path(path)
    return "active" if current_path?(path)

    ""
  end
end
