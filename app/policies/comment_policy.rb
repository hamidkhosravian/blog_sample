class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index
    true
  end

  def show?
    true
  end

  def create
    @user.present?
  end

  def update?
    user.admin? or comment.user == @user
  end

  def destroy?
    user.admin? or comment.user == @user
  end
end
