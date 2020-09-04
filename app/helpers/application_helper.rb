module ApplicationHelper
  def conditional_view(data, cls: '')
    if data.is_a?(Array)
      data.each do |item|
        concat content_tag(:p, item, class: cls)
      end
    else
      content_tag(:p, data, class: cls)
    end
  end

  def signed_in?
    return true if session[:user]

    false
  end

  def authenticated?
    return if signed_in?

    flash[:error] = 'Please login first'
    redirect_to new_session_path
  end

  def conditional_link(cond, link)
    return unless cond
    if link.is_a?(Array)
        link.each do |l|
            concat link_to l[:lbl], l[:path], method: l[:mtd]
        end
    else
        link_to link[:lbl], link[:path]
    end
  end

  def authorized_links!
    if signed_in?
      concat link_to 'events', events_path
      concat link_to 'users', users_path
      link_to 'log out', session_path(current_user), method: :delete
    else
      concat link_to 'sign up', new_user_path
      link_to 'log in', new_session_path
    end
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user_name
    current_user.name if signed_in?
  end

  def error_view(errors)
    return unless errors.any?
    concat content_tag(:div,
                         content_tag(:h2,
                                     "#{pluralize(errors.count, 'error')}
                                    prohibited this user from being saved:"))
    conditional_view(errors.full_messages)
  end
end
