json.extract! goal, :id, :name, :description, :goal_type, :status, :target_date, :organization_id, :parent_id, :created_at, :updated_at
json.url goal_url(goal, format: :json)
