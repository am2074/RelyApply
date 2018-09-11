json.extract! review, :id, :position, :employment_type, :satisfaction, :created_at, :updated_at
json.url review_url(review, format: :json)
