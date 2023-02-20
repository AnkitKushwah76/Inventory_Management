# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(users)
    byebug
    return unless users.has_role? 'admin'

    can :read, Items
  end
end
