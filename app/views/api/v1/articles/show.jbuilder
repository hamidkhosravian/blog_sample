json.id    @article.id
json.body  @article.body
json.title @article.title
json.created_by @article.user.email
json.created_at @article.created_at
json.is_owner   @article.is_owner?(@current_user)
