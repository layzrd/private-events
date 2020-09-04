module ApplicationHelper
    def conditional_view(data, cls: '')
        content_tag(:p, data, class: cls) if data
    end

    def current_user
        session[:user]
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
        if cond
            if link.is_a?(Array)
                link.each do |l|
                    concat link_to l[:lbl], l[:path], method: l[:mtd]
                end
            else
                link_to link[:lbl], link[:path]
            end
        end
    end

    def authorized_links!
        if signed_in?
            concat link_to 'events', events_path
            concat link_to 'users', users_path
            link_to 'log out', session_path(current_user['id']), method: :delete
        else
            concat link_to 'sign up', new_user_path
            link_to 'log in', new_session_path
        end
    end
end
