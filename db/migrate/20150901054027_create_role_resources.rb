class CreateRoleResources < ActiveRecord::Migration
  def change
    create_table :role_resources do |t|
      t.integer :access_id
      t.string :resource_name

      t.timestamps null: false
    end
  end
end
