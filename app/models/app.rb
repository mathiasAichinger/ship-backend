class App < ActiveRecord::Base
  has_and_belongs_to_many :lane_templates
  has_many :builds
end
