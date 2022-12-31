class RemoveColumnLabels < ActiveRecord::Migration[6.1]
  def change
    remove_index :labels, column: :user_id
    remove_column :labels, :user_id, :bigint
  end
end
