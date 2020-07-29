# TABLES

# Learners DB設計
## userテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, add_index :users, :email,unique: true|
|password|string|null: false|
### Association
- has_many :memos
- has_many :tags

## memoテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||
|body|text||
|image|string||
|user_id|reference|null: false, foreign_key: true|
|tag_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tag

## tagテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
### Association
- has_many :tags
- belongs_to :user
