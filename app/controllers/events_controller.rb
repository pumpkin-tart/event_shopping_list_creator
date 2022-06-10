class EventsController < ApplicationController

  def index
    @events = current_user.events.includes(:user).order(created_at: :desc)
  end

  def new
    @event = Event.new
    @event.circles.build
  end
    
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash.now['success'] = t('defaults.message.created', item: Event.model_name.human)
      render :show
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Event.model_name.human)
      render :new
    end
  end



  def show
    @event = Event.find(params[:id])
    @circle = Circle.new
    @circles = @event.circles.order(created_at: :desc)
  end

  def edit
    @event = current_user.events.find(params[:id])
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
    redirect_to events_path, success: t('defaults.message.deleted', item: 'イベントMAP')
  end
    
  private
    
  def event_params
    params.require(:event).permit(:title, :map_image, :map_image_cache, circles_attributes: [:circle_id])
  end

end
