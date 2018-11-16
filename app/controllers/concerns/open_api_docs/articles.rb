module OpenApiDocs::Articles
  extend ActiveSupport::Concern

  included do
    components do
      api_key :Token, field: "Authorization", in: "header", desc: "pass api key to header"
      path! IdPath: [:id, Integer, desc: "id"]
      bearer_auth(:Token, format = "JWT", other_info = { })
    end

    api :index, "show all articles" do
      resp 200, "Blog Sample response", :json, data: {
        "articles": [
          {
            "id": "integer",
            "title": "string",
            "created_by": "string",
            "created_at": "datetime",
            "is_owner": "boolean"
          }
        ]
      }
    end

    api :show, "show article details" do
      path  :id, Integer
      resp 200, "Blog Sample response", :json, data: {
        "id": "integer",
        "title": "string",
        "body": "string",
        "created_by": "string",
        "created_at": "datetime",
        "is_owner": "boolean"
      }
    end

    api :create, "create article" do
      need_auth   :Token

      query  :title, String
      query  :body, String
      resp 201, "Blog Sample response", :json, data: {
        "id": "integer",
        "title": "string",
        "created_by": "string",
        "created_at": "datetime",
        "is_owner": "boolean"
      }
    end

    api :update, "update article details" do
      need_auth   :Token

      path  :id, Integer
      query  :title, String
      query  :body, String
      resp 200, "Blog Sample response", :json, data: {
        "id": "integer",
        "title": "string",
        "created_by": "string",
        "created_at": "datetime",
        "is_owner": "boolean"
      }
    end

    api :destroy, "delete article details" do
      need_auth   :Token

      path  :id, Integer
      resp 204, "Blog Sample response", :json, data: {}
    end
  end
end
