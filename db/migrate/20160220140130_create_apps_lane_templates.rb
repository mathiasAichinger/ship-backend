class CreateAppsLaneTemplates < ActiveRecord::Migration
  def change
    create_table :apps_lane_templates do |t|
      t.references :app
      t.references :lane_template
    end

    add_index :apps_lane_templates, [:lane_template_id, :app_id], :name => "lt_a"
    add_index :apps_lane_templates, [:lane_template_id], :name => "lt"
  end
end
