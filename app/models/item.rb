class Item < ApplicationRecord
  has_many :comments
  validates :name, presence: true
  validates :category, presence: true
end
