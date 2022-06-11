class ItemsController < ApplicationController

  def create
    @circle = Circle.find(params[:circle_id])
    @item = @circle.items.build(item_params)
    if @item.save
      redirect_to event_circle_path(@item), controller: :circles, action: :show, success: t('defaults.message.created', item: 'アイテム')
    else
      flash.now['danger'] = t('defaults.message.not_created', item: 'アイテム')
      render :new
    end
  end

  def show
    @circle = Circle.find(params[:circle_id])
    @item = @circle.items.find(params[:id])
  end

  def new
    @circle = Circle.find(params[:circle_id])
    @item = Item.new
  end

  def edit
    @circle = Circle.find(params[:circle_id])
    @item = current_user.items.find(params[:id])
  end

  def destroy
    @circle = Circle.find(params[:circle_id])
    @item = Item.find(params[:id])
    @item.destroy!
    redirect_to @circle, success: t('defaults.message.deleted', item: 'イベントMAP')
  end

  private
    
  def item_params
    params.require(:item).permit(:item_name, :price, :item_image, :item_memo)
  end
end
