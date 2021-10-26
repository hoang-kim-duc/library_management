# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all
    user ||= User.new # guest user (not logged in)
    can [:read, :create], Book
    can [:edit, :destroy], Book do |book|
      book.user_id == user.id
    end
  end
end
