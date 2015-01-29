module ApplicationHelper
  def logo_with_text
    "#{logo} REMbooth".html_safe
  end

  def logo
    '<span class="glyphicon glyphicon-calendar red-logo" aria-hidden="true"></span>'.html_safe
  end

  def ask_for_link_twitter_account?
    user_signed_in? && !current_user.linked_twitter_account?
  end

  def bootstrap_class_for(flash_type)
    {success: 'alert-success', error: 'alert-error', alert: 'alert-warning', notice: 'alert-info'}[flash_type.to_sym] || flash_type.to_s
  end
end
