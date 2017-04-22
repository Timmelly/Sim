json.extract! computer_status, :id, :status, :users, :computer_id, :created_at, :updated_at
json.url computer_status_url(computer_status, format: :json)