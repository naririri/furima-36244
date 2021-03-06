class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number, :user_id, :item_id, :order_id,
                :token

  with_options presence: true do
    validates :city
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :mobile_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字（ハイフンなし）で入力してください' }
  validates :postal_number, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'は半角数字（ハイフンあり）で入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, mobile_number: mobile_number, order_id: order.id)
  end
end
