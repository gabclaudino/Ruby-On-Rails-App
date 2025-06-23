module ApplicationHelper
  def nav_link_to(name, path)
    classes = class_names(
      "nav-link",
      "active": current_page?(path)
    )
    link_to name, path, class: classes
  end
end
