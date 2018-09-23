json.comments @comments do |comment|
  json.text comment.text
  json.user comment.user.name
  json.event comment.event.name
end
