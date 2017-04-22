json.extract! computer, :id, :ip, :mac, :name, :created_at, :updated_at
json.url computer_url(computer, format: :json)