class AddAasmStateToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :aasm_state, :string
  end
end
