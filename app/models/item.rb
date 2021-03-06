class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :order
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
    validates :price, inclusion: { in: 300..9_999_999, message: 'は範囲内で入力してください' }
  end

  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :post_date_id
  end

  validates :price, numericality: { only_integer: true, message: 'は半角数字のみで入力してください' }
end
