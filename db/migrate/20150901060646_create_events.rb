class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :resource_object_id
      t.string :resource_object_type
      t.string :action
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
