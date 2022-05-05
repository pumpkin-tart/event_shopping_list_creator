class EventsController < ApplicationController
  def new
    @event = Event.new
  end
    
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to login_path #あとで修正
    else
      render :new
    end
  end
    
  private
    
  def event_params
    params.require(:event).permit(:title, :map_image, :map_image_cache)
  end
end
