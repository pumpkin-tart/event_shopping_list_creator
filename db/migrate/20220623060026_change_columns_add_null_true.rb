class ChangeColumnsAddNullTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :map_image, :string, null: true
  end
end
