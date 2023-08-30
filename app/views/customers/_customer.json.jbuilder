json.extract! customer, :id, :account_id, :name, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
