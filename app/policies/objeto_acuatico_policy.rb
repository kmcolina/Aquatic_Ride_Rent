class ObjetoAcuaticoPolicy < ApplicationPolicy
  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def create?
    true
  end

  def show
    return true
  end

end
