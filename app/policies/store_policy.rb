class StorePolicy < ApplicationPolicy

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.role? :admin or @user.role? :vendor
  end

  def update?
    @user.role? :admin or @user.role? :vendor or @user.role? :provider
  end

  def destroy?
    @user.role? :admin
  end





end