class CreateAccessesUsers < ActiveRecord::Migration
  def change
    create_table :accesses_users do |t|
      t.integer :access_id
      t.integer :user_id
    end
  end
end
