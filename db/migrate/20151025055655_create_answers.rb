class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :test, index: true, foreign_key: true
      t.references :kanji, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
