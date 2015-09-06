class AddProjectIdToTodolist < ActiveRecord::Migration
  def change
    add_column :todolists, :project_id, :integer
  end
end
