# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    can :read, Worker
    can :read, Office

    return unless user.present?
    user_worker = user.worker
    user_worker_id = user_worker.present? ? user_worker.id : nil
    user_office_id = user_worker.office.present? ? user_worker.office.id : nil

    can :update, Worker, user: user
    can :update, Office, id: user_office_id

    can :show, Shift, worker: user_worker
    can :show, Vacation, worker: user_worker

    can [:read, :create], Comment

    return unless user.admin?
    can :manage, :all
  end
end
