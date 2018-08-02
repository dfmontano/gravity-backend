class ProductPolicy < ApplicationPolicy

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.role? :provider or @user.role? :admin
  end

  def approve?
    @user.role? :admin
  end

  def update?
    @user.role? :vendor or @user.role? :admin
  end

end