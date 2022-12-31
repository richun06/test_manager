class RemoveColumnTasks < ActiveRecord::Migration[6.1]
  def change
    remove_index :tasks, column: :label_id
    remove_column :tasks, :label_id, :bigint
  end
end
