module Comments
  class Update
    include Peafowl

    attribute :body, String
    attribute :comment, Comment

    validates :comment, presence: true

    def call
      comment.body = body if body.present?
      comment.save!

      context[:comment] = comment
    end
  end
end
