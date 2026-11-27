module ApplicationHelper
  def set_breadcrumbs(*items)
    content_for :breadcrumbs do
      safe_join(
        items.map.with_index do |(label, path), index|
          item = path.present? ? link_to(label, path, class: "text-dark text-decoration-none") : label

          index.zero? ? item : safe_join([" › ", item])
        end
      )
    end
  end
end
