# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    title { "テスト商品" }
    explanation { "テスト商品の説明" }
    price { 5000 }
    condition_id { 1 } # 使用する状態のID
    cost_id { 1 }      # 配送料の負担のID
    category_id { 1 }  # カテゴリーのID
    region_id { 1 }    # 発送元の地域のID
    schedule_day_id { 1 } # 発送までの日数のID

    association :user # ユーザーとのアソシエーションを追加

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
  end
end
