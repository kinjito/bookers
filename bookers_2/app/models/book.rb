class Book < ApplicationRecord
  # attachment :image
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end
