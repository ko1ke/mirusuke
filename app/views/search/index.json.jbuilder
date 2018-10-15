json.array! @users, partial: 'each_schedules/each_one', as: :each_one do |user|
  json.username user.username
  json.schedules user.schedules
end

# json.array! @users, partial: 'each_schedules/each_one', as: :each_one
