class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :content, presence: true
end
