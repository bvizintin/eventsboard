module ApplicationHelper
  def full_title(page_title = " ")
    default_title = "Eventsboard - Share your events"
    if page_title.empty?
      default_title
    else
      "#{page_title} :: #{default_title}"
    end
  end

  def event_status(event)
    if Time.now < event.start_date
      return content_tag(:span, "", class: "upcoming") + "Upcoming"
    elsif Time.now > event.start_date && Time.now < event.end_date
      return content_tag(:span, "", class: "upcoming") + "In duration"
    else
      return content_tag(:span, "", class: "past") + " Past event"
    end
  end



end
