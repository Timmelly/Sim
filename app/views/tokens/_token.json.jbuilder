json.extract! token, :id, :token, :date_end, :api_action, :created_at, :updated_at
json.url token_url(token, format: :json)