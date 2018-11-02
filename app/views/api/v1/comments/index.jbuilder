json.comments @comments do |comment|
  json.id comment.id
  json.body comment.body
  json.created_by comment.user.email
  json.created_at comment.created_at
end
