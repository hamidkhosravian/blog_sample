module Comments
  class Save
    include Peafowl

    attribute :user, User
    attribute :body, String
    attribute :article, Article

    validates :body, presence: true
    validates :user, presence: true
    validates :article, presence: true

    def call
      article = ::Comment.new
      article.body = body
      article.user = user
      article.article = article
      article.save!

      context[:comment] = comment
    end
  end
end
