class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :image, :publisher, :year, :available, :actual_rent

  def available
    return true if object.actual_rent.blank?

    # rubocop:disable Rails/Date
    !Date.today.between?(object.actual_rent.from, object.actual_rent.to)
    # rubocop:enable Rails/Date
  end

  def actual_rent
    # rubocop:disable Style/StringLiterals
    object&.actual_rent&.attributes&.except("updated_at", "created_at")
    # rubocop:enable Style/StringLiterals
  end
end
