class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :text
      t.integer :order
      t.references :kanji, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
