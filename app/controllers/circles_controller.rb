class CirclesController < ApplicationController
  def create
    @circle = circles.build(circle_params)
    @event = Event.find(params[:event_id])
    if @circle.save
      redirect_to @event, success: t('defaults.message.created', item: 'サークル')
    else
      flash.now['danger'] = t('defaults.message.not_created', item: 'サークル')
      render :new
    end

  end

  def show
    @circle = Circle.find(params[:id])
    @item = Item.new
    @items = @circle.items.order(created_at: :desc)
  end

  def new
    @event = Event.find(params[:event_id])
    @circle = Circle.new
    @circle.items.build
  end

  def edit
    @event = Event.find(params[:event_id])
    @circle = current_user.circles.find(params[:id])
  end

  def update
    @circle = current_user.circles.find(params[:id])
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
    params.require(:circle).permit(:hall_no, :circle_no, :circle_image, :circle_image_cache, :circle_name, :circle_memo).merge(event_id: params[:event_id])
  end
end
