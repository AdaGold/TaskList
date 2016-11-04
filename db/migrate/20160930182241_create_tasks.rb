class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      
      t.string :title
      t.string :description
      t.text :details
      t.boolean :completion_status
      t.timestamp :completion_date

      t.timestamps null: false
    end
  end
end
