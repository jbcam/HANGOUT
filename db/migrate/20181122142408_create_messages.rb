class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :messageable, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  add_index :messages, [:messageable_id, :messageable_type]
  end
end
