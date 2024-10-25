# データベース設計

## ユーザー情報テーブル(users)

| Column             | Type                | Options                  |
| ------------------ | ------------------- | ------------------------ |
| name               | string              | null: false              |
| email              | string              | null: false, unique:true |
| encrypted_password | string              | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_date         | date                | null: false              |

### Association

* has_one :items
* has_many :records

## 商品情報テーブル(items)

| Column             | Type                | Options                        |
| ------------------ | ------------------- | ------------------------------ |
| title              | string              | null: false                    |
| user               | references          | null: false, foreign_key: true |
| price              | integer             | null: false                    |
| explanation        | text                | null: false                    |
| condition_id          | integer                | null: false                 |
| cost_id          | integer                | null: false                    |
| category_id          | integer                | null: false                 |
| region_id          | integer                | null: false                    |
| schedule_day_id          | integer                | null: false            |

### Association

* belongs_to :user
* has_one :record

## 購入記録テーブル(records)

| Column             | Type                | Options                        |
| ------------------ | ------------------- | ------------------------------ |
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :shipment

## 発送先情報テーブル(shipments)

| Column             | Type                | Options                        |
| ------------------ | ------------------- | ------------------------------ |
| post_code          | string              | null: false |
|  region_id          | integer                | null: false  |
| city               | string          | null: false |
| house_number             | string              | null: false                |
| building            | string           |                      |
| tel               | string             | null: false                    |
| record           | references          | null: false, foreign_key: true |


### Association

* belongs_to :record