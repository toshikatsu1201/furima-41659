# spec/factories/ship_records.rb

FactoryBot.define do
  factory :ship_record do
    token { "tok_1g1j11lk1jk1" }
    post_code { '123-4567' }
    region_id { 1 }
    city { '横浜市' }
    house_number { '青山1-1-1' }
    building { '柳ビル103' }
    tel { '09012345678' }
  end
end
