module Articles
  class Save
    include Peafowl

    attribute :user, User
    attribute :body, String
    attribute :title, String

    validates :user, presence: true
    validates :body, presence: true
    validates :title, presence: true

    def call
      article = ::Article.new
      article.title = title
      article.body = body
      article.user = user
      article.save!

      context[:article] = article
    end
  end
end
