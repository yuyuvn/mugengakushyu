class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
      t.string :mean
      t.string :pronounce
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
