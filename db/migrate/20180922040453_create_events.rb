class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :lat, null: false
      t.string :lng, null: false

      t.timestamps
    end
  end
end
