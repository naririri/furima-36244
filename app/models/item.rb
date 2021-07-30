class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :postage_id
  belongs_to :prefecture_id
  belongs_to :post_date_id

  with_options presence: true do
    validates :name
    validates :info
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :post_date_id
  end
end
