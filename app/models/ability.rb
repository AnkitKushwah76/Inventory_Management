# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(users)
    byebug
    if users.has_role? 'admin'
      can :read, Items
      puts "ooooooooooooooooooooooooooooo"
    end
    
  end
end
