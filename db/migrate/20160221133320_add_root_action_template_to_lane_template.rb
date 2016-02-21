class AddRootActionTemplateToLaneTemplate < ActiveRecord::Migration
  def change
    add_reference :lane_templates, :root_action_template, references: :action_templates
  end
end
