class CreateCircleGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :circle_genres do |t|
      t.references :circle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
