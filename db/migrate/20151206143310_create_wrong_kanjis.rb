class CreateWrongKanjis < ActiveRecord::Migration
  def change
    create_table :wrong_kanjis do |t|
      t.integer :times, :default => 0
      t.references :user, index: true, foreign_key: true
      t.string :kanji, index: true

      t.timestamps null: false
    end
  end
end
