class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
