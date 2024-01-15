# テーブル設計

## usersテーブル

| Column            | Type   | Options                       |
| ----------------- | ------ | -------------                 |
| email             | string | null:false, uniqueness:true   |
| encrypted_password| string | null:false                    |
| name              | string | null:false                    |
| profile           | text   | null:false                    |
| occupation        | text   | null:false                    |
| position          | text   | null:false                    |

### Association
- has_many :prototypes
- has many :comments



## prototypesテーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | -------------                 |
| title             | string     | null:false                    |
| catch_copy        | text       | null:false                    |
| concept           | text       | null:false                    |
| user              | references | null:false, foreign_key: true |
## imageはActiverecordで実装する

### Association
- belong_to :users
- has many :comments


## commentsテーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | -------------                 |
| content           | text       | null:false                    |
| prototype         | references | null:false, foreign_key: true |
| user              | references | null:false, foreign_key: true |

### Association
- belong_to :users
- belong_to :prototypes