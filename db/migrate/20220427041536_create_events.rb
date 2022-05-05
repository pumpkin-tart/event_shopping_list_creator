class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :map_image, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
