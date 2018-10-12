json.extract! each_one, :id, :username, :created_at, :updated_at
# json.url app_url(each_one, format: :json)
json.url schedule_url (each_one, format: :json)