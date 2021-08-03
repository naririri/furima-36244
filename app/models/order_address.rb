class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :house_number, :building, :mobile_number, :user_id, :order_id

  with_options presence: true do
    validates :postal_number
    validates :city
    validates :house_number
    validates :postal_number
    validates :mobile_number
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end