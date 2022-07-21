class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  has_many :cart_items
  has_many :order_details

#税込価格を標示する記述ここを変えると一括ですべてのtaxが変わる
 def with_tax_price
    (without_tax * 1.1).floor
 end
end
