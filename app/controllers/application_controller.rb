class ApplicationController < ActionController::API
  rescue_from BadRequestError, with: :bad_request_error
  rescue_from NotFoundError, with: :not_found_error
  rescue_from JWT::DecodeError, with: :authentication_error
  rescue_from JWT::ExpiredSignature, with: :authentication_error
  rescue_from AuthorizationError, with: :authentication_error

  private

  def bad_request_error(exception)
    render json: { response: JSON.parse(exception.message), status: 400 }.to_json, status: 400
  end

  def authentication_error
    render json: { response: I18n.t("messages.http._401"), status: 401 }.to_json, status: 401
  end

  def not_found_error(exception)
    render json: { response: JSON.parse(exception.message), status: 404 }.to_json, status: 404
  end
end
