module EventsHelper
  def list_events(obj)
    content_tag(:ul, :class => 'bg-gray-200') do
      obj.each do |event|
        concat content_tag(:li, "#{event.description} on #{event.updated_at.to_s(:short)}")
        concat link_to 'Show', event
      end
    end
  end
end
