class LaneTemplate < ActiveRecord::Base
  has_and_belongs_to_many :action_templates
  has_and_belongs_to_many :apps
  belongs_to :root_action_template, :class_name => "ActionTemplate", :foreign_key => 'root_action_template_id'
end
