json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :user_id
  json.url alarm_url(alarm, format: :json)
end
