json.extract! history, :id, :project_id, :user_id, :previous_status, :new_status, :created_at, :updated_at
json.url history_url(history, format: :json)
