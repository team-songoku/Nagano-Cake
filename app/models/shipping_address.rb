class ShippingAddress < ApplicationRecord
  belongs_to :customer

  #注文情報入力画面の登録済み住所から選択で使用（customer/orders/new.html#line27）
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
