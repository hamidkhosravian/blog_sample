module Token
  class Encode
    include Peafowl

    attribute :payload, Hash
    validates :payload, presence: true

    def call
      payload[:iss] = ENV["ISSUER"].to_s
      payload[:iat] = Time.now.to_i
      payload[:exp] = ttl.to_i

      token = JWT.encode(payload, secret_key)

      context[:token] = token
    end

    private
    def secret_key
      Rails.application.credentials.secret_key_base || ENV["SECRET_KEY"]
    end

    def ttl
      time_expiration = ENV["AUTH_TOKEN_TTL"] || 1000
      time_expiration.to_i.minute.from_now
    end
  end
end
