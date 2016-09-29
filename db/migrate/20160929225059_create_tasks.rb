class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :description
      t.string :completion_status
      t.date :completion_date

      t.timestamps null: false
    end
  end
end
