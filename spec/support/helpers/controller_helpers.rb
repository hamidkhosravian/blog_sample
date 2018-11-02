module ControllerHelpers
  def sign_in(user = nil)
    @current_user = user || create(:user)
    @current_user.save!

    result = ::Token::Generate.call(user: @current_user)

    request.headers["Authorization"] = "bearer " + result.auth_token.token
  end

  def admin_sign_in(user = nil)
    @current_user = user || create(:user, role: 'admin')
    @current_user.save!

    result = ::Token::Generate.call(user: @current_user)

    request.headers["Authorization"] = "bearer " + result.auth_token.token
  end

  def current_user
    @current_user
  end
end
