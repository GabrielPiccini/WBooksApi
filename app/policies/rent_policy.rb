class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    record.all? do |rent|
      rent.user_id == user.id
    end
  end

  def create?
    user.id == record.user_id
  end
end
