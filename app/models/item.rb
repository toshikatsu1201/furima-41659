class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :record
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost
  belongs_to_active_hash :region
  belongs_to_active_hash :schedule_day

  has_one_attached :image

  validates :image, presence: { message: 'を添付してください' }
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は¥300〜¥9,999,999の間で入力してください' }
end

