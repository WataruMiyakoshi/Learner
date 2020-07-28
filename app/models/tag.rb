class Tag < ApplicationRecord
  has_many :memos
  belongs_to :user
end
