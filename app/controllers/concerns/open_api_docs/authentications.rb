module OpenApiDocs::Authentications
  extend ActiveSupport::Concern

  included do
    api :sign_in, "user sing in" do
      query :email, String, desc: "user email address"
      query :password, String, desc: "user password"

      resp 200, "Blog Sample response", :json, data: {
        "email": "String",
        "is_admin": "boolean",
        "token": {
          "id": "integer",
          "token": "string",
          "expire_at": "datetimes"
        }
      }
    end

    api :sign_up, "user sing up" do
      query :email, String, desc: "user email address"
      query :password, String, desc: "user password"
      query :confirm_password, String, desc: "user confirm password"
      resp 201, "Blog Sample response", :json, data: {
        "response": "string",
        "status": "string"
      }
    end
  end
end
