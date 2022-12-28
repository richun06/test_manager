class AddLabelRefToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :label, foreign_key: true
  end
end
