# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nick_name          | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name               | string  | null: false |
| reading_name       | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :orders
- has_one  :address


## itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| price      | integer    | null: false                    |
| image      | 
| condition  | string     | null: false                    |
| category   | string     | null: false                    |
| text       | string     | null: false                    |

### Association

- belongs_to :user
- has_one    :order
- has_one    :address


## ordersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| buyer     | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| order_log |            |                                | 

### Association

- has_one :user
- has_one :item
- has_one :address


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| order         | references | null: false, foreign_key: true |
| postal_number | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| mobile_number | integer    | null: false                    |

### Association

- has_one :user
- has_one :item
- has_one :order
