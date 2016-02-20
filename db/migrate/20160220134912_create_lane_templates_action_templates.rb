class CreateLaneTemplatesActionTemplates < ActiveRecord::Migration
  def change
    create_table :action_templates_lane_templates, :id => false do |t|
      t.references :lane_template
      t.references :action_template
    end

    add_index :action_templates_lane_templates, [:lane_template_id, :action_template_id], :name => "lt_at"
    add_index :action_templates_lane_templates, [:action_template_id], :name => "at"
  end
end
