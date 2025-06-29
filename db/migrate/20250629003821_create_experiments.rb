class CreateExperiments < ActiveRecord::Migration[8.0]
  def change
    create_table :experiments do |t|
      t.string :name
      t.text :hypothesis
      t.text :actions_taken
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.text :inspection_summary
      t.text :adaptation_summary
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
