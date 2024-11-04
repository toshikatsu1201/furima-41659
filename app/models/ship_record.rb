class ShipRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :city, :house_number, :building, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :tel, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only numbers" }
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)

    # 発送先情報を保存する
    Shipment.create(post_code: post_code, region_id: region_id, city: city, house_number: house_number, building: building, tel: tel, record_id: record.id)
  end
end
