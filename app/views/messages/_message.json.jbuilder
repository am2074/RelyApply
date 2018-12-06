json.extract! message, :id, :email, :first_name, :last_name, :subject, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
