class ApplicationController < ActionController::API

  include Response
  include ExceptionHandler
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  # Raises 401 error if user is not authorized
  def user_not_authorized
    render :json => {error: "you are not authorized to perform this action"}, status:401
    logger.info "Current user email: " +  current_user.email
  end

end
