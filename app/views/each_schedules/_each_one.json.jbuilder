json.extract! each_one, :id, :username, :schedules
json.url each_schedules_url(each_one, format: :json)