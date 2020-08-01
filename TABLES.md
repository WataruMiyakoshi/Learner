# Learner Tables Design
## devise_users
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, add_index :users, :email,unique: true|
|encrypted_password|string|null: false|
### Association
- has_many :memos
- has_many :tags

## memos
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|image|string||
|user_id|reference|null: false, foreign_key: true|
|tag_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tag

## tags
|Column|Type|Options|
|------|----|-------|
|name|string|null: false
|user_id|reference|null: false, foreign_key: true|
### Association
- has_many :tags
- belongs_to :user
