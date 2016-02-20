class RenameLaneTemplatesColumn < ActiveRecord::Migration
  def change
    rename_column :lanes, :lane_templates_id, :lane_template_id
  end
end
