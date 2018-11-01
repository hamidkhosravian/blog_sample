json.articles @articles do |article|
  json.id article.id
  json.title article.title
  json.created_at article.created_at
end
