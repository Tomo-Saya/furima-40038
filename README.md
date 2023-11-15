## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

## Association
 - has_many : items
 - has_many : comments
 - has_many : orders


## itemsテーブル

| Column          | Type       | Options                         |
| -------------   | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| description     | text       | null: false                     |
| category_id     | integer    | null: false                     |
| condition_id    | integer    | null: false                     |
| cost_id         | integer    | null: false                     |
| prefecture_id   | integer    | null: false                     |
| shipping_day_id | integer    | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false, foreign_keys: true |

## Association
 - belongs_to : user
 - has_many : comments
 - has_one : order


## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false foreign_keys: true |
| item    | references | null: false foreign_keys: true |

## Association
 - belongs_to : user
 - belongs_to : comment


## ordersテーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| user    | references | null: false, foreign_keys: true |
| item    | references | null: false, foreign_keys: true |


## Association
 - belongs_to : user
 - has_one : item
 - has_one : address


## addressesテーブル

| Column        | Type       | Options                         |
| ------------- | ------     | ------------------------------- |
| postcode      | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| city          | string     | null: false                     |
| address       | string     | null: false                     |
| building      | string     |                                 |
| tel           | string     | null: false                     |
| order         | references | null: false, foreign_keys: true |

## Association
 - has_one : order