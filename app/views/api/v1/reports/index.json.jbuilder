json.reports @reports do |report|
  json.user report.user.name
  json.comment report.comment.text
end
