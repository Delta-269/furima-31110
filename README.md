# テーブル設計

## users テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| nick_name       | string  | null: false       |
| name_zen_family | string  | null: false       |
| name_zen_first  | string  | null: false       |
| name_han_family | string  | null: false       |
| name_han_first | string  | null: false       |
| birthday        | date | null: false       |

### Association

- has_many :items
- has_many :records
- belongs_to_active_hash :birthday

## items テーブル

| Column      | Type      | Options                         |
| ----------- | --------- | ------------------------------- |
| name        | string    | null: false                     |
| description | text      | null: false                     |
| category_id | integer   | null: false                     |
| status_id   | integer   | null: false                     |
| burden_id   | integer   | null: false                     |
| area_id     | integer   | null: false                     |
| day_id      | integer   | null: false                     |
| price       | integer   | null: false                     |
| user        | reference | null : false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :burden
- belongs_to_active_hash :area
- belongs_to_active_hash :day
- belongs_to_active_hash :price


## records テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :residence


## residence
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| post     | string    | null: false                    |
| area_id  | integer   | null: false                    |
| city     | string    | null: false                    |
| address  | string    | null: false                    |
| building | string    |                                |
| phone    | string    | null: false                    |
| records  | reference | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :area
- belongs_to :record
