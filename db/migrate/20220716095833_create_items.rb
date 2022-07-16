class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :without_tax, null: false
      t.boolean :is_active, null: false, default: true
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
