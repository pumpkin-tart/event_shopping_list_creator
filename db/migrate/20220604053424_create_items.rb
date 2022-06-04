class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :price
      t.string :item_image
      t.string :item_memo
      t.references :circle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
