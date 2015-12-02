class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
