class CreateGoalKvms < ActiveRecord::Migration[8.0]
  def change
    create_table :goal_kvms do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :kvm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
