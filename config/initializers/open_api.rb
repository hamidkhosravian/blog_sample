require "open_api"

class String # Symbol
  def match?(pattern)
    !match(pattern).nil?
  end
end
OpenApi::Config.tap do |c|
   c.file_output_path = "public/api_docs/open_api"

   c.instance_eval do
      open_api :blog_sample_openapi, base_doc_class: Api::V1::ApiController
      info version: "1.0.0", title: "Blog Sample Swagger documentation", description: "API documentation of Blog Sample"
      server '', desc: "Main (production) server"
    end
end
