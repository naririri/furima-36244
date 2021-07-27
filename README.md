# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nick_name          | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| reading_first_name | string  | null: false               |
| reading_last_name  | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| name         | string     | null: false                    |
| price        | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| info         | text       | null: false                    |
| postage_id   | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| post_date_id | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :order
- has_one    :address


## ordersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_number | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| mobile_number | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :order
