module OpenApiDocs::Comments
  extend ActiveSupport::Concern

  included do
    components do
      api_key :Token, field: "Authorization", in: "header", desc: "pass api key to header"
      path! IdPath: [:id, Integer, desc: "id"]
      bearer_auth(:Token, format = "JWT", other_info = { })
    end

    api :index, "show all comments" do
      path  :article_id, Integer

      resp 200, "Blog Sample response", :json, data: {
        "comments": [
          {
            "id": "integer",
            "body": "string",
            "created_by": "string",
            "created_at": "datetime",
            "is_owner": "boolean"
          }
        ]
      }
    end

    api :show, "show comment details" do
      path  :article_id, Integer
      path  :id, Integer
      resp 200, "Blog Sample response", :json, data: {
        "id": "integer",
        "body": "string",
        "created_by": "string",
        "created_at": "datetime",
        "is_owner": "boolean"
      }
    end

    api :create, "create comment" do
      need_auth   :Token

      path  :article_id, Integer
      query  :body, String
      resp 201, "Blog Sample response", :json, data: {
        "id": "integer",
        "body": "string",
        "created_by": "string",
        "created_at": "datetime",
        "is_owner": "boolean"
      }
    end

    api :update, "update comment details" do
      need_auth   :Token

      path  :article_id, Integer
      path  :id, Integer
      query  :body, String
      resp 200, "Blog Sample response", :json, data: {
        "id": "integer",
        "body": "string",
        "created_by": "string",
        "created_at": "datetime",
        "is_owner": "boolean"
      }
    end

    api :destroy, "delete comment details" do
      need_auth   :Token

      path  :article_id, Integer
      path  :id, Integer
      resp 204, "Blog Sample response", :json, data: {}
    end
  end
end
