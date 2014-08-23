json.array!(@courses) do |course|
  json.extract! course, :id, :Name
  json.url course_url(course, format: :json)
end
