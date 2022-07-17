class Item < ApplicationRecord
  has_one_attached :image

# ジャンルテーブル作成の際にコメントアウト外して下さい。
# これがあるとジャンルカラムにnot_nullがあるので商品の新規投稿できません
  # belongs_to :genre
  # has_many :cart_items
  # has_many :order_details
end
