class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    redirect_to root_path if (current_user.id == @item.user_id) || @item.order.present?
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      card_pay
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def card_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
