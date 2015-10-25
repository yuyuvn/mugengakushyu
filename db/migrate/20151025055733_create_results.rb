class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :test, index: true, foreign_key: true
      t.integer :order
      t.references :answer, index: true, foreign_key: true
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
