module Comments
  class Update
    include Peafowl

    attribute :body, String
    attribute :comment, Comment

    validates :comment, presence: true

    def call
      article.body = body if body.present?
      article.save!

      context[:article] = article
    end
  end
end
