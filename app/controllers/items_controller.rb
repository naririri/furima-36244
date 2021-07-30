class ItemsController < ApplicationController
  def index
    # current_user = User.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :condition_id, :postage_id, :prefecture_id, :post_date_id, :price).merge(:user_id: current_user.id)
  end


end
