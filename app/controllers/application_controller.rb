class ApplicationController < ActionController::API
  rescue_from BadRequestError, with: :bad_request_error
  rescue_from NotFoundError, with: :not_found_error

  private

  def bad_request_error(exception)
    render json: { response: JSON.parse(exception.message), status: 400 }.to_json, status: 400
  end

  def not_found_error(exception)
    render json: { response: JSON.parse(exception.message), status: 404 }.to_json, status: 404
  end
end
