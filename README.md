## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| name               | string | null: false,              |
| name_katakana      | string | null: false,              |
| birthday           | string | null: false,              |

## Association
 - has_many : items
 - has_many : comments
 - has_many : orders


## itemsテーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| image       | string     | null: false                     |
| name        | string     | null: false                     |
| description | text       | null: false                     |
| category    | string     | null: false                     |
| condition   | string     | null: false                     |
| cost        | string     | null: false                     |
| place       | string     | null: false                     |
| days        | string     | null: false                     |
| price       | string     | null: false                     |
| user        | references | null: false, foreign_keys: true |

## Association
 - belongs_to : users
 - has_many : comments
 - has_one : orders


## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false foreign_keys: true |
| item    | references | null: false foreign_keys: true |

## Association
 - belongs_to : users
 - belongs_to : comments


## ordersテーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| number  | string     | null: false, unique: true       |
| date    | string     | null: false                     |
| code    | string     | null: false, foreign_keys: true |
| user    | references | null: false, foreign_keys: true |

## Association
 - belongs_to : users
 - has_one : items
 - has_one : addresses


## addressesテーブル

| Column     | Type       | Options                         |
| ---------- | ------     | ------------------------------- |
| postcode   | string     | null: false                     |
| address    | string     | null: false                     |
| prefecture | string     | null: false                     |
| building   | string     | null: false                     |
| tel        | string     | null: false                     |
|order       | references | null: false, foreign_keys: true |

## Association
 - has_one : orders