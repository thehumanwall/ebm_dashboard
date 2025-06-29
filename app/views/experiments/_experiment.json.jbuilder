json.extract! experiment, :id, :name, :hypothesis, :actions_taken, :start_date, :end_date, :status, :inspection_summary, :adaptation_summary, :goal_id, :created_at, :updated_at
json.url experiment_url(experiment, format: :json)
