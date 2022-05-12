class EventsController < ApplicationController

  def index
    @event = Event.all
    render :show
  end

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

  def edit
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, success: t('defaults.message.updated', item: Event)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Event)
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy!
    redirect_to new_event_path
  end
    
  private
    
  def event_params
    params.require(:event).permit(:title, :map_image, :map_image_cache)
  end
end
