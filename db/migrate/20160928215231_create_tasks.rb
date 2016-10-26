class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :category
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end