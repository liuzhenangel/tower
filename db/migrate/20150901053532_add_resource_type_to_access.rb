class AddResourceTypeToAccess < ActiveRecord::Migration
  def change
    add_column :accesses, :resource_type, :string
    add_column :accesses, :resource_id, :integer
  end
end
