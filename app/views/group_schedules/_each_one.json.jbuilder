# frozen_string_literal: true

json.extract! each_one, :id, :username, :created_at, :updated_at
json.url group_schedule_url(each_one, format: :json)
