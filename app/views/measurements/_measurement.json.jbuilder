json.extract! measurement, :id, :value, :measurement_date, :notes, :kvm_id, :experiment_id, :created_at, :updated_at
json.url measurement_url(measurement, format: :json)
