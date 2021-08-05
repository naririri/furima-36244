class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    #@order_address = OrderAddress.new(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number).merge(user_id: current_user.id,item_id: params[:item_id])
    #params.permit(:postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  #def address_params
    #params.permit(:postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number).merge(user_id: current_user.id,item_id: params[:item_id])
  #end
end
