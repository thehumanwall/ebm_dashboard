class CreateMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :measurements do |t|
      t.decimal :value, precision: 15, scale: 2
      t.datetime :measurement_date
      t.text :notes
      t.references :kvm, null: false, foreign_key: true
      t.references :experiment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
