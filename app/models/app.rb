class App < ActiveRecord::Base
  validates_presence_of :key
  validates_uniqueness_of :key

  has_and_belongs_to_many :lane_templates
  has_many :builds, dependent: :destroy
end
