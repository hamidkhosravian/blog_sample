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
      comment = ::Comment.new
      comment.body = body
      comment.user = user
      comment.article = article
      comment.save!

      context[:comment] = comment
    end
  end
end
