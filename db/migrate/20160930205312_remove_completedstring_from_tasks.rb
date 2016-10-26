class RemoveCompletedstringFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :completed, :string
  end
end
