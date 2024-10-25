# データベース設計

## ユーザー情報テーブル(users)

| Column             | Type                | Options                  |
| ------------------ | ------------------- | ------------------------ |
| name               | string              | null: false              |
| email              | string              | null: false, unique:true |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_date         | date                | null: false              |

### Association

* has_one :items
* has_many :records
* has_many :shipments

## 商品情報テーブル(items)

| Column             | Type                | Options                        |
| ------------------ | ------------------- | ------------------------------ |
| title              | string              | null: false                    |
| user               | references          | null: false, foreign_key: true |
| price              | decimal             | null: false                    |
| image              | binary              | null: false                    |
| explanation        | text                | null: false                    |
| condition          | text                | null: false                    |

### Association

* has_one :users
* has_one :records
* has_many :shipments

## 購入記録テーブル(records)

| Column             | Type                | Options                        |
| ------------------ | ------------------- | ------------------------------ |
| user               | references          | null: false, foreign_key: true |
| item               | string              | null: false, foreign_key: true |

### Association

* has_many :users
* has_one :items

## 発送先情報テーブル(shipments)

| Column             | Type                | Options                        |
| ------------------ | ------------------- | ------------------------------ |
| user               | references          | null: false, foreign_key: true |
| email              | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |
| region             | string              | null: false                    |
| days               | integer             | null: false                    |
| cost               | decimal             | null: false                    |

### Association

* has_one :users
* has_one :items