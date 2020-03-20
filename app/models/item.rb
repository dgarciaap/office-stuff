class Item < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true

  enum status: {open: 0, fulfill: 1, dismiss: 2}
end
