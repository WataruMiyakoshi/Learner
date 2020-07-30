class Memo < ApplicationRecord
  belongs_to :user
  # belongs_to :tag
  validates :body, presence: true
  def self.search(search, current_user_id)
    return Memo.where(user_id: current_user_id) \
      unless search
    Memo.where('title LIKE(?) and user_id =
       ?', "%#{search}%", current_user_id) \
      .or(Memo.where('body LIKE(?) and user_id =
       ?', "%#{search}%", current_user_id))
  end
end
