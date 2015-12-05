class AddTitleToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :title, :string
    add_column :goals, :private, :bool
  end
end
