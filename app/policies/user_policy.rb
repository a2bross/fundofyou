class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit_criteria?
    true
  end

  def chose_donation?
    true
  end

  def update_criteria?
    true
  end

  def result?
    true
  end
end
