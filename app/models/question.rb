class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user, presence: true

  has_many :answers
end
