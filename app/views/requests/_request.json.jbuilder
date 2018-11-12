json.extract! request, :id, :company_id, :name_suggestion, :website_suggestion, :user, :created_at, :updated_at
json.url request_url(request, format: :json)
