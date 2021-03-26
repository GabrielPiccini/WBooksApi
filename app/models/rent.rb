class Rent < ApplicationRecord
  validates :user, presence: true
  validates :book, presence: true
  validates :from, presence: true
  validates :to, presence: true

  belongs_to :user
  belongs_to :book
end
