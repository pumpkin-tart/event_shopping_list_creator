class ItemsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @circle = Circle.find(params[:circle_id])
    @item = @circle.items.build(item_params)
    if @item.save
      redirect_to event_circle_path(@event, @circle, @item), success: t('defaults.message.created', item: 'アイテム')
    else
      flash.now['danger'] = t('defaults.message.not_created', item: 'アイテム')
      render :new
    end
  end

  def show
    @event = Event.find(params[:event_id])
    @circle = Circle.find(params[:circle_id])
    @item = @circle.items.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @circle = Circle.find(params[:circle_id])
    @item = @circle.items.build
  end

  def edit
    @event = Event.find(params[:event_id])
    @circle = Circle.find(params[:circle_id])
    @item = @circle.items.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:event_id])
    @circle = Circle.find(params[:circle_id])
    @item = Item.find(params[:id])
    @item.destroy!
    redirect_to event_circle_path(@event, @circle), success: t('defaults.message.deleted', item: 'アイテム')
  end

  private
    
  def item_params
    params.require(:item).permit(:item_name, :price, :item_image, :item_memo)
  end
end
