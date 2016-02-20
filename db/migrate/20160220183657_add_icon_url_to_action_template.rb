class AddIconUrlToActionTemplate < ActiveRecord::Migration
  def change
    add_column :action_templates, :icon_url, :string
  end
end
