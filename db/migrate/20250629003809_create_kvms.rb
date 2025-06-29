class CreateKvms < ActiveRecord::Migration[8.0]
  def change
    create_table :kvms do |t|
      t.string :name
      t.text :description
      t.string :unit_of_measure
      t.boolean :is_active
      t.references :organization, null: false, foreign_key: true
      t.references :kva, null: false, foreign_key: true

      t.timestamps
    end
  end
end
