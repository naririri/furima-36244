class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :post_date

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :post_date_id
  end

  validates_inclusion_of :price, in: 300..9999999
end
