module ApplicationHelper
  def nav_link_to(current_identifier, *args, &block)
    identifier = block_given? ? args[1].delete(:identifier) : args[2].delete(:identifier)
    content_tag :li, class: (:active if identifier == current_identifier) do
      link_to(*args, &block)
    end
  end

  def navbar_link_to(*args, &block)
    nav_link_to(@current_nav_identifier, *args, &block)
  end
end
