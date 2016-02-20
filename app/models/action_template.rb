class ActionTemplate < ActiveRecord::Base
  has_and_belongs_to_many :lane_templates
end
