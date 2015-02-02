module ApplicationHelper
  def notify flash_type
    case flash_type
    when "alert"
      "alert-success"
    when "error"
      "alert-danger"
    when "warning"
      "alert-warning"
    when "info"
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
