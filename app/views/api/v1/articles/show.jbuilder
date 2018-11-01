json.id @article.id
json.body @article.body
json.title @article.title
json.is_owner @article.is_owner?(@current_user)
json.created_at @article.created_at
