# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    puts "Initializing Ability for user: #{user.inspect}"
    # user ||= User.includes(:role).new(username: "guess", password: "guess", role_id: 5)

    if user.role.guess?
      can :read, :form
    end

    if user.role.developer?
      puts "develper role"
      can :read, :form
      can [:read, :create], :assignments
      puts "User that makes the request: #{user.inspect}"
    end

    if user.role.admin?
      puts "here admin"
      can :manage, :all
    end

    if user.role.employee?
      can :read, :companies
      can [:create, :update, :read], :assignments
    end
  end
end
