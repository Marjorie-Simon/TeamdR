class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def approve?
    true
  end

  def decline?
    true
  end

  def update?
    user ==  record.user
  end

  def destroy?
    user ==  record.user
  end
end
