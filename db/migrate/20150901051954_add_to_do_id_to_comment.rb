class AddToDoIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :todo_id, :integer
  end
end
