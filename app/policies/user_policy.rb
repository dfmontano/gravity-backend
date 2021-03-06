class UserPolicy < ApplicationPolicy

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index_by_role?
    @user.role? :admin
  end

end