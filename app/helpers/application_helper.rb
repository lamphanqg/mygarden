module ApplicationHelper
  def flash_alert
    capture do
      if notice.present?
        concat(content_tag(:div, class: "alert alert-primary alert-dismissible fade show", role: "alert") do
          concat notice.to_s
          concat button_tag("", class: "btn-close", "data-bs-dismiss": "alert", "aria-label": "Close")
        end)
      end

      if alert.present?
        concat(content_tag(:div, class: "alert alert-danger alert-dismissible fade show", role: "alert") do
          concat alert.to_s
          concat button_tag("", class: "btn-close", "data-bs-dismiss": "alert", "aria-label": "Close")
        end)
      end
    end
  end
end
