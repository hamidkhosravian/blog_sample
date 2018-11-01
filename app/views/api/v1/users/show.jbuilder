json.email @user.email
json.email @user.is_admin?
json.token do
  json.partial! "api/v1/tokens/show", token: @user.token
end
