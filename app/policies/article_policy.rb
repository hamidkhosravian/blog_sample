class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
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
    user.admin? or article.user == @user
  end

  def destroy?
    user.admin? or article.user == @user
  end
end
