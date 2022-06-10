class CreateCircles < ActiveRecord::Migration[7.0]
  def change
    create_table :circles do |t|
      t.string :hall_no
      t.string :circle_no
      t.string :circle_image
      t.string :circle_name, null: false
      t.text :circle_memo
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
