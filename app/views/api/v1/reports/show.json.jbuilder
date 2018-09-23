json.report do
  json.user @report.user.name
  json.comment @report.comment.text
end
