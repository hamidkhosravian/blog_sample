module Articles
  class Update
    include Peafowl

    attribute :body, String
    attribute :title, String
    attribute :article, Article

    validates :article, presence: true

    def call
      article.title = title if title.present?
      article.body = body if body.present?
      article.save!

      context[:article] = article
    end
  end
end
