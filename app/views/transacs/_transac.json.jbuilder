json.extract! transac, :id, :name, :amount, :author_id, :created_at, :updated_at
json.url transac_url(transac, format: :json)
