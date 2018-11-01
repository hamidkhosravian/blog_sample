module Articles
  class Save
    include Peafowl

    attribute :user, User
    attribute :body, String
    attribute :title, String
    attribute :article, Article

    validates :user, presence: true
    validates :body, presence: true
    validates :title, presence: true
    validates :article, presence: true

    def call
      article.title = title
      article.body = body
      article.user = user
      article.save!

      context[:article] = article
    end
  end
end
