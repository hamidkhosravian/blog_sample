json.id   @comment.id
json.body @comment.body
json.created_by @comment.user.email
json.created_at @comment.created_at
json.is_owner   @comment.is_owner?(@current_user)
