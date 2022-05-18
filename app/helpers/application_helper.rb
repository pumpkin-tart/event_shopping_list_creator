module ApplicationHelper
  def events_for_sidebar
    @sidebar_events = Event.all.reverse
  end
end
