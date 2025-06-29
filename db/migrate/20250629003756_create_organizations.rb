class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :vision_statement
      t.text :mission_statement

      t.timestamps
    end
  end
end
