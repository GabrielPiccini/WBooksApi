class Book < ApplicationRecord
  validates :genre, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :publisher, presence: true
  validates :year, presence: true

  has_many :rents, dependent: :destroy

  def actual_rent
    rents.where('rents.from <= ?', Time.zone.today).order(:from).last
  end
end
