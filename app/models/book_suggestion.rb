class BookSuggestion < ApplicationRecord
  validates :author, presence: true
  validates :title, presence: true
  validates :link, presence: true

  belongs_to :user, optional: true
end
