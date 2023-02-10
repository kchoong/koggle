json.extract! worker, :id, :first_name, :last_name, :birthday, :address_1, :address_2, :city, :country, :postcode, :work_hours, :vacation_days, :created_at, :updated_at
json.url worker_url(worker, format: :json)
