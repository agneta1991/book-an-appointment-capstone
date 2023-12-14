class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.persisted?
      can :create, Reservation
      can :read, Reservation

      can :manage, :all if user.admin?
    else
      can :read, :all
    end
  end
end
