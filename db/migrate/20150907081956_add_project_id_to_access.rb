class AddProjectIdToAccess < ActiveRecord::Migration
  def change
    add_column :accesses, :project_id, :integer
  end
end
