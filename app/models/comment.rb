class Comment < ApplicationRecord
  belongs_to :item
  validates :commenter, presence: true
  validates :body, presence: true
end
