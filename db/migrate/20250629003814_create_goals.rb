class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.string :goal_type
      t.string :status
      t.date :target_date
      t.references :organization, null: false, foreign_key: true
      t.references :parent_goal, foreign_key: { to_table: :goals }, index: true

      t.timestamps
    end
  end
end
