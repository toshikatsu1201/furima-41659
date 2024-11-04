class Shipment < ApplicationRecord
  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
  validates :region_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :building, allow_blank: true
  validates :tel, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください" }
  
  belongs_to :record
end
