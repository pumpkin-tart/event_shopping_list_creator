class EventsController < ApplicationController
  before_action :require_login
  def new
    @event = Event.new
  end
    
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      render :show
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end
    
  private
    
  def event_params
    params.require(:event).permit(:title, :map_image, :map_image_cache)
  end
end
