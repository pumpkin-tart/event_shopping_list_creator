class ChangeColumnToAllowNull < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :events, :map_image, :string, null: true
    end
  
    def down
      change_column :events, :map_image, :string, null: false
    end
  end
end
