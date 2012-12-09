class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstName
      t.string :lastName
      t.text :biography
      t.date :birthDate
      t.string :avatar

      t.timestamps
    end
  end
end
