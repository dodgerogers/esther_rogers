json.array!(@posts) do |post|
  json.extract! post, :title, :keywords, :body
  json.url post_url(post, format: :json)
end
