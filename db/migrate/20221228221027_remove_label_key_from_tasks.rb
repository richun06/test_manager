class RemoveLabelKeyFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :tasks, :labels
  end
end
