# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { "test_user" }
    last_name { "山田" }
    first_name { "太郎" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    password { "Password1" }
    password_confirmation {"Password1"}
    email { Faker::Internet.email }
    birth_date { "2000-12-01"}
  end
end
