class ActionTemplate < ActiveRecord::Base
  has_and_belongs_to_many :lane_templates
  has_one :child, :class_name => "ActionTemplate", foreign_key: "parent_id"
  belongs_to :parent, :class_name => "ActionTemplate"
end
