class Comment < ApplicationRecord
  belongs_to :new
  validates :author, presence: true
  validates :comment, presence: true
end
