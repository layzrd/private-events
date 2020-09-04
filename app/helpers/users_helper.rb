module UsersHelper
  def list_user(obj)
    content_tag(:ul, class: 'bg-gray-200') do
      obj.each do |user|
        concat content_tag(:li, "#{user.name} (@#{user.username})")
        concat link_to 'Show', user
      end
    end
  end
end
