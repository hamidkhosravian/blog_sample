class ApplicationController < ActionController::API
  include Pundit

  rescue_from ActiveRecord::RecordInvalid, with: :database_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_invalid_error
  rescue_from BadRequestError, with: :bad_request_error
  rescue_from NotFoundError, with: :not_found_error
  rescue_from JWT::DecodeError, with: :authentication_error
  rescue_from JWT::ExpiredSignature, with: :authentication_error
  rescue_from AuthorizationError, with: :authentication_error
  rescue_from Pundit::NotAuthorizedError, with: :access_error

  private

  def bad_request_error(exception)
    render json: { response: JSON.parse(exception.message), status: 400 }.to_json, status: 400
  end

  def database_error(exception)
    exception = [exception.message]
    render json: { response: exception, status: 400 }.to_json, status: 400
  end

  def record_invalid_error(exception)
    exception = [exception.message]
    render json: { response: exception, status: 404 }.to_json, status: 404
  end

  def authentication_error
    render json: { response: [I18n.t("messages.http._401")], status: 401 }.to_json, status: 401
  end

  def access_error
    render json: { response: [I18n.t("user.error.access")], status: 401 }.to_json, status: 401
  end

  def not_found_error(exception)
    render json: { response: JSON.parse(exception.message), status: 404 }.to_json, status: 404
  end
end
