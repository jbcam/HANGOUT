class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :lng, :longitude
    rename_column :users, :lat, :latitude
  end
end
