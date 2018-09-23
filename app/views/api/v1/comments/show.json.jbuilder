json.comment do
  json.text @user.text
  json.user @user.user.name
  json.event @user.event.name
end
