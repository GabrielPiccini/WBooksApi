class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :image, :publisher, :year, :available, :actual_rent

  def available
    return true if object.actual_rent.blank?

    !Time.zone.today.between?(object.actual_rent.from, object.actual_rent.to)
  end

  def actual_rent
    object&.actual_rent&.attributes&.except('updated_at', 'created_at')
  end
end
