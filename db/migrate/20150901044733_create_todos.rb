class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.integer :user_id
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
