# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| first_name          | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana     | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many : orders
- has_many : items

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------  | ------------------------------ |
| product_name        | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| situation_id        | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| region_of_origin_id | integer    | null: false                    |
| number_of_day_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user


## addresses テーブル

| Column               | Type       | Options                        |
| -------------------  | ---------- | ------------------------------ |
| post_code            | string     | null: false                    |
| region_of_origin_id  | integer    | null: false                    |
| municipalities       | string     | null: false                    |
| address              | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |
| order                | references | null: false, foreign_key: true |


### Association
- belongs_to :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- belongs_to :item

