# テーブル設計

## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| nickname           | string | null: false            |
| email              | string | null: false,ユニーク制約 |
| encrypted_password | string | null: false            |
| fast_name          | string | null: false            |
| last_name          | string | null: false            |
| fast_name_kana     | string | null: false            |
| last_name_kana     | string | null: false            |
| birthday           | date   | null: false            |

### Association

- has_many : orders
- has_many : product_informations

## product_information テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| product_name     | string  | null: false |
| explanation      | text    | null: false |
| category         | integer | null: false |
| situation        | integer | null: false |
| shipping_charges | integer | null: false |
| region_of_origin | integer | null: false |
| number_of_days   | integer | null: false |
| price            | integer | null: false |


### Association

- has_one :order
- belongs_to :users


## address テーブル

| Column         | Type    | Options     |
| -------------  | ------- | ----------- |
| post_code      | string  | null: false |
| prefectures    | integer | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building       | string  | null: false |
| phone_number   | string  | null: false |


### Association

- belongs_to :order

## order テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :address

