class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :logo
      t.string :name

      t.timestamps
    end
  end
end
