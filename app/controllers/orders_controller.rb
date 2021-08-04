class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    #@order = Order.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  #def address_params
    #params.permit(:postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number).merge(user_id: current_user.id,item_id: params[:item_id])
  #end
end
