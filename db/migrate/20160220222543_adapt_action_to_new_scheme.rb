class AdaptActionToNewScheme < ActiveRecord::Migration
  def change
    remove_column :actions, :name
    remove_column :actions, :description
    add_reference :actions, :action_template
  end
end
