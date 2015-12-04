class CreateKanjis < ActiveRecord::Migration
  def change
    create_table :kanjis do |t|
      t.string :text
      t.string :mean
      t.string :other_mean
      t.string :kun
      t.string :on
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
