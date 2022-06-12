class CirclesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @circle = @event.circles.build(circle_params)
    if @circle.save
      redirect_to @event, success: t('defaults.message.created', item: 'サークル')
    else
      flash.now['danger'] = t('defaults.message.not_created', item: 'サークル')
      render :new
    end

  end

  def show
    @event = Event.find(params[:event_id])
    @circle = @event.circles.find(params[:id])
    @items = @circle.items.order(created_at: :desc)
  end

  def new
    @event = Event.find(params[:event_id])
    @circle = Circle.new
  end

  def edit
    @event = Event.find(params[:event_id])
    @circle = Circle.find(params[:id])
  end

  def update
    @circle = Circle.find(params[:id])
    if @circle.update(circle_params)
      redirect_to @circle, success: t('defaults.message.updated', item: Circle)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Circle)
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @circle = Circle.find(params[:id])
    @circle.destroy!
    redirect_to @event, success: t('defaults.message.deleted', item: 'イベントMAP')
  end
    
  private
    
  def circle_params
    params.require(:circle).permit(:hall_no, :circle_no, :circle_image, :circle_image_cache, :circle_name, :circle_memo, items_attributes: [:item_id])
  end
end
