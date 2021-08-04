class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :postal_number
    validates :city
    validates :house_number
    validates :postal_number
    validates :mobile_number
    validates :user_id
    validates :item_id
    validates :order_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, mobile_number: mobile_number, order_id: order.id)
    #Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, mobile_number: mobile_number, user_id: user_id, item_id: item_id)
  end
end