module EventsHelper
  def list_events(obj)
    content_tag(:ul, class: 'bg-gray-200') do
      obj.each do |event|
        concat content_tag(:li, "#{event.description} on #{event.updated_at.to_s(:short)}")
        concat link_to 'Show', event
      end
    end
  end

  def list_array_event(obj)
    content_tag(:ol, class: 'bg-gray-200') do
      obj.each do |event|
        concat content_tag(:li, "#{event[2]} Location: #{event[1]}  Hosted by: #{event[0]} Date: #{event[3]}")
      end
    end
  end
end
