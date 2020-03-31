class Item < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  has_many :comments
  belongs_to :user
end
