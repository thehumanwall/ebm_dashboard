json.extract! kvm, :id, :name, :description, :unit_of_measure, :is_active, :organization_id, :kva_id, :created_at, :updated_at
json.url kvm_url(kvm, format: :json)
