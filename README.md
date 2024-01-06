# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |

### Association

- has_many :events

## events テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| name              | string     | null: false                    |
| event_date        | date       | null: false                    |

### Association

- belongs_to :user
- has_many :event_versions

## event_versions テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_id          | references | null: false, foreign_key: true |
| version_number    | integer    | null: false                    |
| details           | text       | null: false                    |
| cost              | decimal    | null: false                    |
| input_date        | date       | null: false                    |

### Association

- belongs_to :event
- has_many :guests
- has_many :ceremonies
- has_many :foods
- has_many :venues
- has_many :costumes
- has_many :beauties
- has_many :flowers
- has_many :prints
- has_many :stagings
- has_many :photos
- has_many :videos
- has_many :gifts
- has_many :pre_weddings

## guests テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| event_version      | references | null: false, foreign_key: true|
| adult_count        | string     | null: false                   |
| child_count        | string     | null: false                   |

### Association

- belongs_to :event_version

## ceremonies テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## foods テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## venues テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## costumes テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## beauties テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    | null: false                    |

### Association

- belongs_to :event_version

## flowers テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## prints テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## stagings テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## photos テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## videos テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## gifts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version

## pre_ceremonies テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_version     | references | null: false, foreign_key: true |
| type              | text       |                                |
| cost              | decimal    |                                |

### Association

- belongs_to :event_version