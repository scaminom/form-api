# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.includes(:role).new(username: "guess", password: "guess", role_id: 5)

    can :read, Form if user.guess?
    can :manage, :all if user.admin?
    can :read, [Form, Assignment] if user.developer?
    can :read, Company if user.employee?
    # cannot :create, Student if user.teacher?d
  end
end
