class LaneTemplate < ActiveRecord::Base
  has_and_belongs_to_many :action_templates
  has_and_belongs_to_many :apps
end
