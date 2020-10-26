# テーブル設計

## users テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| nick_name       | string  | null: false       |
| name_zen_family | string  | null: false       |
| name_zen_first  | string  | null: false       |
| name_han_family | string  | null: false       |
| name_han_family | string  | null: false       |
| birthday        | integer | null: false       |

### Association

- has_many :items
- has_many :records
- belongs_to_active_hash :birthday

## items テーブル

| Column      | Type      | Options                         |
| ----------- | --------- | ------------------------------- |
| name        | string    | null: false                     |
| description | text      | null: false                     |
| category    | integer   | null: false                     |
| status      | integer   | null: false                     |
| burden      | integer   | null: false                     |
| area        | integer   | null: false                     |
| day         | integer   | null: false                     |
| price       | integer   | null: false                     |
| user        | reference | null : false, foreign_key: true |

### Association

- belongs_to :user
- has_many :records
- has_many :residence
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

- has_many :user
- has_many :item
- has_one :residence


## residence
| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| post     | string    | null: false                    |
| city     | integer   | null: false                    |
| street   | string    | null: false                    |
| address  | string    | null: false                    |
| building | string    |                                |
| phone    | string    | null: false                    |
| records  | reference | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :city
- belongs_to :records
