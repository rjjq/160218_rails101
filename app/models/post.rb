class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :author, class_name: "User", foreign_key: :user_id
  belongs_to :group, counter_cache: :posts_count

  validates :content, presence: true

  def editable_by?(user)
    user && user == author
  end
end
