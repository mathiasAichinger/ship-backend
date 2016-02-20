class AdaptLaneToNewScheme < ActiveRecord::Migration
  def change
    remove_column :lanes, :name
    remove_column :lanes, :description
    add_reference :lanes, :lane_templates
  end
end
