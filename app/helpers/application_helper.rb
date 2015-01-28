module ApplicationHelper
  def logo_with_text
    "#{logo} REMbooth".html_safe
  end

  def logo
    '<span class="glyphicon glyphicon-calendar red-logo" aria-hidden="true"></span>'.html_safe
  end

  def linked_twitter_account?
    user_signed_in? && current_user.linked_twitter_account?
  end
end
