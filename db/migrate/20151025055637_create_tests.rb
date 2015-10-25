class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :word, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
